import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:intl/intl.dart';
import 'package:jobpro/core/utils/image_constant.dart';
import 'package:jobpro/core/utils/size_utils.dart';
import 'package:jobpro/presentation/job_details/job_details_page.dart';
import 'package:jobpro/utils/cache_manager.dart';
import 'package:jobpro/utils/globals.dart';
import 'package:jobpro/widgets/app_bar/appbar_image.dart';
import 'package:jobpro/widgets/app_bar/appbar_title.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to JobDetailsPage when back is pressed
        Get.to(JobDetailsPage());
        return false; // Prevent default back navigation
      },
      child:
    Scaffold(
      appBar: CustomAppBar(
        leadingWidth: getHorizontalSize(48),
        leading: AppbarImage(
          svgPath: ImageConstant.imgGroup162799,
          margin: getMargin(left: 24, top: 13, bottom: 13),
          onTap: () {
            Get.to(JobDetailsPage());
          },
        ),
        centerTitle: true,
        title: AppbarTitle(
          text: "lbl_notifications".tr,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.notificationDetails();
          },
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.reconList.isEmpty) {
              return const Center(child: Text('No notifications found'));
            } else {
              return ListView.builder(
                itemCount: controller.reconList.length,
                itemBuilder: (context, index) {
                  final notification = controller.reconList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16),
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        notification.subject,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Seleto',
                        ),
                      ),
                      subtitle: Text(
                        "${notification.content}\n${_formatDate(notification.creation)}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Times New Roman',
                          color: Colors.black,
                        ),
                      ),
                      isThreeLine: true,
                      leading: const Icon(
                        Icons.notifications,
                        color: Colors.blue,
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ),
      ),
    ));
  }
  String _formatDate(String dateTimeString) {
  try {
    // Parse the string into a DateTime object
    DateTime parsedDate = DateTime.parse(dateTimeString);
    // Format the date as needed
    return DateFormat('MMM dd, yyyy HH:mm:ss').format(parsedDate);
  } catch (e) {
    return dateTimeString; // Return the original string if parsing fails
  }
}
}

List<NotificationModel> notificationFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  final String subject;
  final String content;
  final String creation;

  NotificationModel({
    required this.subject,
    required this.content,
    required this.creation,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        subject: json['subject'] ?? '',
        content: json['content'] ?? '',
        creation: json['creation'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "content": content,
        "creation": creation,
      };
}

class NotificationService extends GetConnect with CacheManager {
  late final String reconUrl;

  @override
  void onInit() {
    super.onInit();
    initializeData();
    httpClient.timeout = const Duration(seconds: 30);
  }

  Future<void> initializeData() async {
    reconUrl =
        '${Globals.url}/api/resource/User%20Notifications?fields=["*"]&order_by=creation desc&limit=10';
  }

  Future<List<NotificationModel>?> notificationDetails() async {
    try {
      print('Recon URL: $reconUrl');
      String apiKey = '4aedf12d2330fbe';
      String apiSecret = '2d72f01e8e1a60a';
      String token = 'token $apiKey:$apiSecret';

      var response = await get(
        reconUrl,
        headers: {'Authorization': token},
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == HttpStatus.ok) {
        var dataList = response.body['data'];
        return notificationFromJson(json.encode(dataList));
      } else {
        print("Unexpected response: ${response.statusText}");
      }
    } catch (e) {
      print('Exception: $e');
    }
    return null;
  }
}

class NotificationController extends GetxController {
  NotificationService notificationService = Get.put(NotificationService());
  var reconList = <NotificationModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    notificationDetails();
    super.onInit();
  }

  Future<void> notificationDetails() async {
    isLoading(true);
    try {
      var notifications = await notificationService.notificationDetails();
      if (notifications != null) {
        reconList.value = notifications;
      }
    } finally {
      isLoading(false);
    }
  }
}
