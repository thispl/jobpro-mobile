import 'package:flutter/material.dart';
import 'package:jobpro/widgets/app_bar/appbar_subtitle.dart';
import '../notifications_screen/widgets/notifications_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/app_bar/appbar_image.dart';
import 'package:jobpro/widgets/app_bar/appbar_title.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  final List<NotificationModel> notifications;

  NotificationScreen({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage(
            svgPath: ImageConstant.imgGroup162799,
            margin: getMargin(left: 24, top: 13, bottom: 13),
            onTap: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "lbl_notifications".tr,
          ),
        ),
      
      
      body: Container(
  color: Colors.white, // Set the background color of the screen
  child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: Colors.white,
            child: ListTile(
              title: Text(notification.title,style: (TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Seleto')),),
              subtitle: Text(
                "${notification.message}\n${notification.timestamp.toLocal()}",
                style: TextStyle(fontSize: 12,fontFamily: 'Times New Roman',color: Colors.black),
              ),
              isThreeLine: true,
              leading: Icon(Icons.notifications, color: Colors.blue),
            ),
          );
        },
      ),
    ));
  }
}


class NotificationModel {
  final String title;
  final String message;
  final DateTime timestamp;

  NotificationModel({
    required this.title,
    required this.message,
    required this.timestamp,
  });
}

final List<NotificationModel> notifications = [
  NotificationModel(
    title: "New Update Available",
    message: "Version 2.0 is now live. Update your app to enjoy new features.",
    timestamp: DateTime.now().subtract(Duration(minutes: 30)),
  ),
  NotificationModel(
    title: "Reminder",
    message: "Your subscription will expire in 3 days.",
    timestamp: DateTime.now().subtract(Duration(hours: 1)),
  ),
];