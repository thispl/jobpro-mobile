import 'package:get/get.dart';

class UserController extends GetxController {
  // Make the userEmail observable so you can update and listen to changes
  var userEmail = ''.obs;

  // Function to set the userEmail
  void setUserEmail(String email) {
    userEmail.value = email;
  }

  // Function to get the current userEmail
  String getUserEmail() {
    return userEmail.value;
  }
}