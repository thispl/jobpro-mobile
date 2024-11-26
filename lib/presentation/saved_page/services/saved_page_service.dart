import 'dart:convert';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/get.dart';
import 'package:jobpro/presentation/saved_page/models/saved_page_model.dart';
import 'package:jobpro/utils/authentication_manager.dart';
import 'package:jobpro/utils/globals.dart';

import 'package:jobpro/utils/cache_manager.dart';
import 'package:jobpro/utils/user_controller.dart';



class SavedPageService extends GetConnect with CacheManager {
  final UserController userController = Get.find();
  late final String userEmail;
  late final String reconUrl; // Declare reconUrl as a late variable
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  @override
  Future<void> onInit() async {
    super.onInit();
    
    // Initialize userEmail and reconUrl
    // userEmail = userController.getUserEmail();
    userEmail = _authManager.getToken()!;
    reconUrl = '${Globals.url}/api/resource/Saved Jobs?filters=[["user_id","in",["$userEmail"]]]&fields=["customer","subject","currency","amount"]&order_by=creation%20desc';
    print(userEmail);
    httpClient.timeout = const Duration(seconds: 30); 
  }

  Future<List<SavedPageModel>?> fetchSavedDetails() async {
    try {
      print('Recon URL: $reconUrl'); 
      String apiKey = 'daa4a43f429c844';
      String apiSecret = '3b0d3fbc3c5e4ce';
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
        
        // Check if dataList is not null before encoding
        if (dataList != null) {
          return savedPageModelFromJson(json.encode(dataList));
        } else {
          print("No data found in response body.");
        }
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
