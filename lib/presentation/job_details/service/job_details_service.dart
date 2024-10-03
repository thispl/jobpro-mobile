import 'dart:convert';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/get.dart';
import 'package:jobpro/presentation/job_details/model/job_details_model.dart';
import 'package:jobpro/utils/globals.dart';

class JobDetailService extends GetConnect {
  final String reconUrl = '${Globals.url}/api/resource/Task?filters=[["service","in",["REC-I","REC-D"]],["vac","!=","0"]]&fields=["customer","subject","currency","amount","total_experience","creation","description","custom_recruiter_contact"]&order_by=creation%20desc';

  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 30); 
    super.onInit();
  }

  Future<List<JobDetailsModel>?> fetchJobDetails() async {
    try {
      print('Recon URL: $reconUrl'); 
      String apiKey = '4aedf12d2330fbe';
      String apiSecret = '2d72f01e8e1a60a';
      String token = 'token $apiKey:$apiSecret';
      var response = await get(
        reconUrl,
        headers: {
          'Authorization': token,
        },
      );
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == HttpStatus.ok) {
        var dataList = response.body['data'];
        return jobDetailsModelFromJson(json.encode(dataList));
      } else {
        print("Unexpected response: ${response.statusText}");
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    }
    return null; // Return null in case of an error
  }
}
