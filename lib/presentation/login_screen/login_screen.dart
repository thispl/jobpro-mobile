import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:jobpro/presentation/reset_password/reset_password.dart';
import 'package:jobpro/utils/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/core/utils/validation_functions.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:jobpro/widgets/custom_text_form_field.dart';

import 'package:jobpro/utils/authentication_manager.dart';
// import 'package:flutter_otp/flutter_otp.dart';

// ignore_for_file: must_be_immutable
// class LoginScreen extends GetWidget<LoginController> {
//   LoginScreen({Key? key}) : super(key: key);

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA70001,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leadingWidth: getHorizontalSize(200),
          leading: Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgGroup162799,
                height: getSize(24),
                width: getSize(24),
                alignment: Alignment.centerLeft,
                onTap: () {
                  onTapImgImage();
                },
              ),
              Padding(
              padding: getPadding(left: 10),
              child: Image.asset(
                "assets/images/TEAMPRO_STROKE_2.png",
                height: getSize(190),
                width: getSize(150),
                fit: BoxFit.contain,
              ),)],
            
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(left: 24, right: 24, bottom: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CustomImageView(
                //   svgPath: ImageConstant.imgGroup162799,
                //   height: getSize(24),
                //   width: getSize(24),
                //   alignment: Alignment.centerLeft,
                //   onTap: () {
                //     onTapImgImage();
                //   },
                // ),
                Padding(
                  padding: getPadding(top: 34),
                  child: Text(
                    "msg_hi_welcome_back".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: getPadding(top: 11),
                  child: Text(
                    "msg_lorem_ipsum_dolor".tr,
                    style: CustomTextStyles.titleSmallBluegray400_1,
                  ),
                ),
                // CustomOutlinedButton(
                //   height: getVerticalSize(56),
                //   text: "msg_continue_with_google".tr,
                //   margin: getMargin(top: 31),
                //   leftIcon: Container(
                //     margin: getMargin(right: 12),
                //     child: CustomImageView(svgPath: ImageConstant.imgGooglesymbol1),
                //   ),
                //   buttonStyle: CustomButtonStyles.outlinePrimary,
                //   buttonTextStyle: theme.textTheme.titleMedium!,
                //   onTap: () {
                //     onTapContinuewith();
                //   },
                // ),
                // CustomOutlinedButton(
                //   height: getVerticalSize(56),
                //   text: "msg_continue_with_apple".tr,
                //   margin: getMargin(top: 16),
                //   leftIcon: Container(
                //     margin: getMargin(right: 12),
                //     child: CustomImageView(svgPath: ImageConstant.imgIconApple),
                //   ),
                //   buttonStyle: CustomButtonStyles.outlinePrimary,
                //   buttonTextStyle: theme.textTheme.titleMedium!,
                // ),
                Padding(
                  padding: getPadding(left: 33, top: 26, right: 33),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(top: 8, bottom: 8),
                        child: SizedBox(
                          width: getHorizontalSize(62),
                          child: Divider(),
                        ),
                      ),
                      // Padding(
                      //   padding: getPadding(left: 12),
                      //   child: Text(
                      //     "msg_or_continue_with".tr,
                      //     style: CustomTextStyles.titleSmallBluegray300,
                      //   ),
                      // ),
                      Padding(
                        padding: getPadding(top: 8, bottom: 8),
                        child: SizedBox(
                          width: getHorizontalSize(74),
                          child: Divider(indent: getHorizontalSize(12)),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 28),
                    child: Text(
                      "lbl_email".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: emailCtr,
                  margin: getMargin(top: 5),
                  hintText: "msg_enter_your_email".tr,
                  hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139),fontSize: 12),
              
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  textStyle: TextStyle(color: const Color.fromRGBO(0, 0, 0, 1)),
                  validator: (value) {
                    if (value == null || (!isValidEmail(value, isRequired: true))) {
                      return "<b>Please enter valid email";
                    }
                    
                    return null;
                  },
                  contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
                  
                ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: getPadding(top: 28),
                //     child: Text(
                //       "Phone Number",
                //       style: theme.textTheme.titleSmall,
                //     ),
                //   ),
                // ),
                // CustomTextFormField(
                //   controller: emailCtr,
                //   margin: getMargin(top: 5),
                //   hintText: "Enter your Phone Number",
                //   hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139),fontSize: 12),
              
                //   textInputAction: TextInputAction.done,
                //   textInputType: TextInputType.phone,
                //   textStyle: TextStyle(color: const Color.fromRGBO(0, 0, 0, 1)),
                //   validator: (value) {
                //     if (value == null || (!isValidEmail(value, isRequired: true))) {
                //       return "<b>Please enter valid phone number";
                //     }
                    
                //     return null;
                //   },
                //   contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
                  
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 28),
                    child: Text(
                      "Password",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: passwordCtr,
                  margin: getMargin(top: 9),
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139),fontSize: 12),
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  textStyle: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null) {
                      return "Please enter correct password";
                    }
                    return null;
                  },
                  contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
                ),
                
                CustomElevatedButton(
                  text: "Login",
                  margin: getMargin(top: 40),
                  buttonStyle: ElevatedButton.styleFrom(
                      primary: theme.colorScheme.primary, // Set the background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(getHorizontalSize(32.00)),
                        
                      ),
                      minimumSize: Size(10, 40), // Width and height of the button
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    ),
                    onTap: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await _viewModel.loginUser(emailCtr.text, passwordCtr.text);                          
                        }
                        
                      },
                ),
                // Padding(
                //   padding: getPadding(bottom: 1),
                //   child: GestureDetector(
                //     onTap: () => ResetPasswordScreen(),
                //     child: Text(
                //       "Forgot Password?",
                //       style: TextStyle(color: Color.fromARGB(255, 105, 105, 105), fontSize: 12),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: getPadding(left: 41, top: 26, right: 41),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: getPadding(bottom: 1),
                        child: Text(
                          "msg_don_t_have_an_account".tr,
                          style: TextStyle(color: Color.fromARGB(255, 105, 105, 105),fontSize: 12),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          onTapTxtLargelabelmediu();
                        },
                        child: Padding(
                          padding: getPadding(left: 2),
                          child: Text(
                            "lbl_sign_up".tr,
                            style: TextStyle(color: theme.colorScheme.primary,fontSize: 14)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: getHorizontalSize(245),
                  margin: getMargin(left: 40, top: 84, right: 40, bottom: 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "msg_by_signing_up_you2".tr,
                          style: CustomTextStyles.titleSmallBluegray400SemiBold,
                        ),
                        TextSpan(
                          text: "lbl_terms".tr,
                          style: CustomTextStyles.titleSmallErrorContainer,
                        ),
                        TextSpan(
                          text: "lbl_and".tr,
                          style: CustomTextStyles.titleSmallBluegray400SemiBold,
                        ),
                        TextSpan(
                          text: "msg_conditions_of_use".tr,
                          style: CustomTextStyles.titleSmallErrorContainer,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapImgImage() {
    Navigator.pop(context);
  }

  onTapTxtLargelabelmediu() {
    Get.toNamed(AppRoutes.signUpCreateAcountScreen);
  }
}
class LoginService extends GetConnect {
  final String loginUrl =
      'https://erp.teamproit.com/api/method/login';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    var token = '';
    print(loginUrl);
    print(model.toJson());
    final response = await post(
      loginUrl,
      model.toJson(),
    );
    
    if (response.statusCode == HttpStatus.ok) {
      response.headers?.forEach((key, value) {
        if (key == 'set-cookie') {
          token = value;
          print(token);
        }
      });
      return LoginResponseModel.fromJson({'token': token});
    } else {
      return null;
    }
  }
}

class LoginResponseModel {
  String? token;

  LoginResponseModel({this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
class LoginRequestModel {
  String? usr;
  String? pwd;

  LoginRequestModel({this.usr, this.pwd});

  Map toJson() {
    final Map data = new Map();
    data['usr'] = this.usr;
    data['pwd'] = this.pwd;
    return data;
  }
}


class LoginViewModel extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.put(AuthenticationManager());
  }

  Future<void> loginUser(String email, String password) async {
    print(email);
    print(password);
    final response = await _loginService
        .fetchLogin(LoginRequestModel(usr: email, pwd: password));
        print(response);
    if (response != null) {
      _authManager.login(response.token);
      print(email); 
      Get.toNamed(AppRoutes.jobDetails);
    } else {
      Get.defaultDialog(
        backgroundColor: Colors.white,
           content: RichText(
            text: TextSpan(
              text: 'User not found!',
              style: TextStyle(
                color: const Color.fromARGB(255, 134, 124, 123), 
                fontSize: 16.0, 
              ),
            ),
          ),
          textConfirm: 'OK',
          confirmTextColor: Colors.blueGrey,
          onConfirm: () {
            Get.back();
          });
    }
  }
}

