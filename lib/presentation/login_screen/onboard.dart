// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jobpro/utils/authentication_manager.dart';
// import 'package:jobpro/presentation/home/home.dart';
// import 'package:jobpro/presentation/login_screen/login_screen.dart';

// class OnBoard extends StatelessWidget {
//   const OnBoard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AuthenticationManager _authManager = Get.find();

//     return Obx(() {
//       return _authManager.isLogged.value ? const HomeView() : const LoginScreen();
//     });
//   }
// }
