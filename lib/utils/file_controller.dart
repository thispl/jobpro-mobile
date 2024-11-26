import 'package:get/get.dart';

class FileController extends GetxController {
  // Make the userEmail observable so you can update and listen to changes
  var file_url = ''.obs;

  // Function to set the userEmail
  void setfileurl(String fileurl) {
    file_url.value = fileurl;
  }

  // Function to get the current setfileurl
  String getfileurl() {
    return file_url.value;
  }
}