import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {TextEditingController emailController = TextEditingController();

Rx<LoginModel> loginModelObj = LoginModel().obs;

@override void onClose() { super.onClose(); emailController.dispose(); } 
 }
