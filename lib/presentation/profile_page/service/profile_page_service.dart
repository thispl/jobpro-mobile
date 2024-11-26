import 'dart:convert';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/get.dart';
import 'package:jobpro/presentation/profile_page/models/profile_page_model.dart';
import 'package:jobpro/utils/authentication_manager.dart';
import 'package:jobpro/utils/globals.dart';
import 'package:jobpro/utils/cache_manager.dart';
import 'package:jobpro/utils/user_controller.dart';
import 'package:http/http.dart' as http;

class ProfilePageService extends GetConnect with CacheManager {
  final UserController userController = Get.find();
  // late final String userEmail;

  late final String email;
  late final String reconUrl; 
  late final String candUrl; 
  late final String token;
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  String? userEmail;
  
  @override
  void onInit() {
    super.onInit();
    initializeData();
    httpClient.timeout = const Duration(seconds: 30); 
  }

  Future<void> initializeData() async {
    // token = _authManager.getToken()!;
  
    
    // Fetch user email asynchronously
    userEmail = _authManager.getToken()!;
    
    print('User Email: $userEmail');
    
    email="siva.m@groupteampro.com";
    reconUrl = '${Globals.url}/api/resource/User?filters=[["name","in",["$userEmail"]]]&fields=["*"]&limit=1';
    candUrl = '${Globals.url}/api/resource/Candidate?filters=[["mail_id","in",["$userEmail"]]]&fields=["*"]&limit=1';

    // httpClient.timeout = const Duration(seconds: 30); 
    
  }

  Future<List<ProfilePageModel>?> profileDetails() async {
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
        return profilePageModelFromJson(json.encode(dataList));
      } else {
        print("Unexpected response: ${response.statusText}");
      }
    } catch (e) {
      print('Exception cand');
      // Get.snackbar('Error', 'An error occurred: $e');
    }
    return null; // Return null in case of an error
  }
  Future<List<CandModel>?> exp_edu_Details() async {
    try {
      print('Cand URL: $candUrl'); 
      String apiKey = '4aedf12d2330fbe';
      String apiSecret = '2d72f01e8e1a60a';
      String token = 'token $apiKey:$apiSecret';
      var response = await get(
        candUrl,
        headers: {
          'Authorization': token,
        },
      );
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == HttpStatus.ok) {
        var dataList = response.body['data'];
        return candModelFromJson(json.encode(dataList));
      } else {
        print("Unexpected response: ${response.statusText}");
      }
    } catch (e) {
      print('Exception url');
      // Get.snackbar('Error', 'An error occurred: $e');

    }
    return null; // Return null in case of an error
  }

    Future<String> updateCv(String email, String name) async {
  String url = '${Globals.url}/api/method/teampro.api.update_cv';

  // Prepare the JSON body
  var body = json.encode({
    "user": email,
    "name": name,
  });

  // Set up authorization header
  String apiKey = '4aedf12d2330fbe';
  String apiSecret = '2d72f01e8e1a60a';
  String token = 'token $apiKey:$apiSecret';

  try {
    // Send the POST request
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': token,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Cookie': getToken().toString(),
      },
      body: body,
    );

    if (response.statusCode == HttpStatus.ok) {
      // Parse the response body
      var data = json.decode(response.body);
      Get.snackbar(
        'Message',
        data['message'],
        snackPosition: SnackPosition.TOP,
      );
      print(data['message']);
      return data['message'];
    } else if (response.statusCode == HttpStatus.forbidden) {
      var data = json.decode(response.body);
      if (data['session_expired'] == 1) {
        _authManager.logOut();
      }
    } else {
      // Show error message for other status codes
      Get.snackbar('Error', response.statusCode.toString());
    }
  } catch (e) {
    // Handle exceptions
    print("An error occurred: $e");
    Get.snackbar('Error', 'An error occurred: $e');
  }

  return 'Update failed';
}

  Future<List<ProfilePageModel>?> cv_details() async {
  print("hi");
  String cvLink = '${Globals.url}/api/resource/candidate?filters=[["mail_id","=","$email"]]&fields=["updated__masked_cv"]';
  
  try {
    print('Recon URL: $cvLink');
    String apiKey = '4aedf12d2330fbe';
    String apiSecret = '2d72f01e8e1a60a';
    String token = 'token $apiKey:$apiSecret';

    var response = await http.get(
      Uri.parse(cvLink),
      headers: {
        'Authorization': token,
      },
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      // Check if 'data' exists and is not empty
      if (jsonData['data'] != null && jsonData['data'].isNotEmpty) {
        // Extract the file URL
        String fileUrl = jsonData['data'][0]['updated__masked_cv'];
        return profilePageModelFromJson(json.encode(fileUrl));
      }
    } else {
      print("Unexpected response: ${response.statusCode}");
    }
  } catch (e) {
    print('Exception: $e');
    Get.snackbar('Error', 'An error occurred: $e');
  }

  // Return a placeholder text if no CV is attached
  return null;
}

  

}
