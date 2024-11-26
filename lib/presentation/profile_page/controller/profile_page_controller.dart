import 'dart:convert';

import 'package:get/get.dart';
import 'package:jobpro/presentation/profile_page/models/profile_page_model.dart';
import 'package:jobpro/presentation/profile_page/service/profile_page_service.dart';
import 'package:jobpro/utils/authentication_manager.dart';
import 'package:jobpro/utils/user_controller.dart';
import 'package:http/http.dart' as http;

class ProfilePageController extends GetxController {
  ProfilePageService profilePageService = Get.put(ProfilePageService());
  // final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  var reconList = <ProfilePageModel>[].obs;
  var candlist = <CandModel>[].obs;
  var cv = <CVModel>[].obs;
  // var savedJobs = <JobDetailsModel>[].obs;
  var isLoading = true.obs;
  var description= ''.obs;
  var isBookmarked = false.obs;
  var message = ''.obs;
  String? userEmail;
  
  void updateCv(String email,String name) async {
    // Call your service here
    var responseMessage = await ProfilePageService().updateCv(email,name);
    message.value = responseMessage;
    isBookmarked.value = true;
    // isSubmitted.value = true;  
  }
  @override
  void onInit() {
     profileDetails();
    exp_edu_Details();
    super.onInit();
  }

  Future<void> profileDetails() async {
  isLoading(true);
  try {
    var recons = await profilePageService.profileDetails();
    if (recons != null) {
      reconList.value = recons;
    }
  } finally {
    isLoading(false); 
  }
  
}
Future<void> exp_edu_Details() async {
  isLoading(true);
  try {
    var cand = await profilePageService.exp_edu_Details();
    if (cand != null) {
      candlist.value = cand;
    }
  } finally {
    isLoading(false); 
  }
}
Future<void> cv_details() async {
  isLoading(true);
  try {
    var cvurl = await profilePageService.cv_details();
    if (cvurl != null) {
      cv.value = cv;
    }
  } finally {
    isLoading(false); 
  }
}
Future<void> updateBio(String newBio) async {
  
  userEmail = _authManager.getToken()!;
  print(newBio);
    try {
      String apiKey = 'daa4a43f429c844';
      String apiSecret = '3b0d3fbc3c5e4ce';
      String token = 'token $apiKey:$apiSecret';
      final response = await http.post(
        Uri.parse('http://erp.teamproit.com/api/method/teampro.api.update_bio'),  // Replace with actual API endpoint and user identifier
        
          headers: {
          'Authorization': token,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
          // 'Content-Type': 'application/json',
        },
        body: jsonEncode({"name":userEmail,"bio": newBio}),
      );

      if (response.statusCode == 200) {
        // Update the bio locally
        reconList.first.bio = newBio;
        reconList.refresh(); // Notify observers of the updated bio
      } else {
        print("Failed to update bio. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error updating bio: $e");
    }
  }
  Future<void> updateSkills(String newskill) async {
  userEmail = _authManager.getToken()!;
  print(newskill);
    try {
      String apiKey = 'daa4a43f429c844';
      String apiSecret = '3b0d3fbc3c5e4ce';
      String token = 'token $apiKey:$apiSecret';
      final response = await http.post(
        Uri.parse('http://erp.teamproit.com/api/method/teampro.api.update_interest'),  // Replace with actual API endpoint and user identifier
        
          headers: {
          'Authorization': token,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
          // 'Content-Type': 'application/json',
        },
        body: jsonEncode({"name":userEmail,"interest": newskill}),
      );
      

      if (response.statusCode == 200) {
        // Update the bio locally
        reconList.first.interest = newskill;
        reconList.refresh(); // Notify observers of the updated bio
      } else {
        print("Failed to update interest. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error updating interest: $e");
    }
  }
}
