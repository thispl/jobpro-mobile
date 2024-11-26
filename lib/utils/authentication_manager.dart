import 'package:get/get.dart';
import 'package:jobpro/utils/cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }
  // void login(Map<String, String> tokenData) async {
  //   isLogged.value = true;
  //   await saveToken(tokenData); // Save the token data as a Map
  // }

  // void checkLoginStatus() {
  //   final tokenData = getToken();
  //   if (tokenData != null && tokenData['otp'] != null && tokenData['phone'] != null) {
  //     isLogged.value = true;
  //   }
  // }
  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}
