
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobpro/presentation/notification/notification_screen.dart';
import 'dart:convert';

import 'package:jobpro/utils/authentication_manager.dart';

class UserController extends GetxController {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  var userEmail = ''.obs;

  void setUserEmail(String email) {
    userEmail.value = email;
  }

  // Function to get the current userEmail
  String getUserEmail() {
    return userEmail.value;
  }

  // Function to fetch the logged-in user's name using the token
  Future<String?> fetchUserName() async {
    final token = _authManager.getToken();
    if (token == null) {
      print("Token is missing, user might be logged out.");
      return null;
    }
    print(token);
    // final userId ='test123@gmail.com';
    // final userId = extractUserIdFromCookie(token);
    final userId = token;
  if (userId != null) {
    print("User ID: $userId");
    return userId;
  } else {
    print("Failed to extract user ID from token.");
    return null;
  }
  }
//   String? extractUserIdFromCookie(String token) {
//   // Regular expression to match `user_id` value
//   final RegExp userIdRegExp = RegExp(r'user_id=([^;]+)');
//   final match = userIdRegExp.firstMatch(token);

//   if (match != null) {
//     return Uri.decodeComponent(match.group(1)!); // Decode URL-encoded characters
//   } else {
//     print("user_id not found in token.");
//     return null;
//   }
// }
}
