import 'dart:convert';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/get.dart';
import 'package:jobpro/presentation/job_details/model/job_details_model.dart';
import 'package:jobpro/utils/globals.dart';
import 'package:jobpro/utils/authentication_manager.dart';
import 'package:jobpro/utils/cache_manager.dart';

class JobDetailService extends GetConnect with CacheManager {
  // final String reconUrl = '${Globals.url}/api/resource/Task?filters=[["service","in",["REC-I","REC-D"]],["exp_end_date","is","set"],["status","in",["Open","Working","Pending Review","Overdue"]]]&fields=["name","customer","subject","currency","amount","custom_job_category","minimum_experience","creation","description","custom_recruiter_contact","territory","custom_country_flag","salary_type","working_days","transportation","contract_period_year","food","accommodation","over_time","exp_end_date","custom_is_customer_confidential"]&order_by=creation%20desc&limit=500';
  final String reconUrl = '${Globals.url}/api/resource/Task?filters=[["service","in",["REC-I","REC-D"]],["exp_end_date","is","set"],["status","in",["Open","Working","Pending Review","Overdue"]]]&fields=["*"]&order_by=creation%20desc&limit=500';
  
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
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
      print('Exception');
      Get.snackbar('Error', 'An error occurred: $e');
    }
    return null; // Return null in case of an error
  }
  Future<String> update_saved_jobs(
    String name,String userEmail,String subject) async {
    String url = '${Globals.url}/api/method/teampro.api.update_saved_jobs';

    var body = json.encode({
      "name":name,
      "user": userEmail,
      "subject": subject,
      // "customer": customer,
      // 'currency': currency,
      // "amount": amount,
      // "days":days
    });
    var response = await post(url, body, headers: {
      'Accept': 'application/json',
      'Cookie': getToken().toString(),
    });
    if (response.statusCode == HttpStatus.ok) {
      var dataList = response.body;
      Get.snackbar(
        'Message',
        dataList['message'],
        snackPosition: SnackPosition.TOP,
      );
      print(dataList);
      return dataList['message'];
    } else {
      if (response.statusCode == HttpStatus.forbidden) {
        if (response.body['session_expired'] == 1) {
          _authManager.logOut();
        }
      } else {
        //show error message
        Get.snackbar('Error', response.statusCode.toString());
      }
    }

    return 'Updated';
  }
  

}
