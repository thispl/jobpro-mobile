import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/core/utils/validation_functions.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:jobpro/widgets/custom_outlined_button.dart';
import 'package:jobpro/widgets/custom_text_form_field.dart';
import 'package:jobpro/domain/googleauth/google_auth_helper.dart';
import 'package:jobpro/utils/authentication_manager.dart';
import 'package:jobpro/presentation/job_details/controller/job_details_controller.dart';
import 'package:jobpro/presentation/job_details/service/job_details_service.dart';
import 'package:jobpro/presentation/job_details/model/job_details_model.dart';

// ignore_for_file: must_be_immutable
// class LoginScreen extends GetWidget<LoginController> {LoginScreen({Key? key}) : super(key: key);

// GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// @override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); 
// return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, backgroundColor: appTheme.whiteA70001, 
// body: Form(key: _formKey, child: Container(width: double.maxFinite, padding: getPadding(left: 24, top: 13, right: 24, bottom: 13), 
// child: Column(mainAxisAlignment: MainAxisAlignment.start, 
// children: [CustomImageView(svgPath: ImageConstant.imgGroup162799, height: getSize(24), width: getSize(24), alignment: Alignment.centerLeft, onTap: () {onTapImgImage();}), Padding(padding: getPadding(top: 44), child: Text("msg_hi_welcome_back".tr, style: theme.textTheme.headlineSmall)), Padding(padding: getPadding(top: 11), child: Text("msg_lorem_ipsum_dolor".tr, style: CustomTextStyles.titleSmallBluegray400_1)), CustomOutlinedButton(height: getVerticalSize(56), text: "msg_continue_with_google".tr, margin: getMargin(top: 31), leftIcon: Container(margin: getMargin(right: 12), child: CustomImageView(svgPath: ImageConstant.imgGooglesymbol1)), buttonStyle: CustomButtonStyles.outlinePrimary, buttonTextStyle: theme.textTheme.titleMedium!, onTap: () {onTapContinuewith();}), CustomOutlinedButton(height: getVerticalSize(56), text: "msg_continue_with_apple".tr, margin: getMargin(top: 16), leftIcon: Container(margin: getMargin(right: 12), child: CustomImageView(svgPath: ImageConstant.imgIconApple)), buttonStyle: CustomButtonStyles.outlinePrimary, buttonTextStyle: theme.textTheme.titleMedium!), Padding(padding: getPadding(left: 33, top: 26, right: 33), child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: getPadding(top: 8, bottom: 8), child: SizedBox(width: getHorizontalSize(62), child: Divider())), Padding(padding: getPadding(left: 12), child: Text("msg_or_continue_with".tr, style: CustomTextStyles.titleSmallBluegray300)), Padding(padding: getPadding(top: 8, bottom: 8), child: SizedBox(width: getHorizontalSize(74), child: Divider(indent: getHorizontalSize(12))))])), Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(top: 28), child: Text("lbl_email".tr, style: theme.textTheme.titleSmall))), CustomTextFormField(controller: controller.emailController, margin: getMargin(top: 9), hintText: "msg_enter_your_email".tr, hintStyle: CustomTextStyles.titleMediumBluegray400, textInputAction: TextInputAction.done, textInputType: TextInputType.emailAddress, validator: (value) {if (value == null || (!isValidEmail(value, isRequired: true))) {return "Please enter valid email";} return null;}, contentPadding: getPadding(left: 12, top: 15, right: 12, bottom: 15)), CustomElevatedButton(text: "msg_continue_with_email".tr, margin: getMargin(top: 40), buttonStyle: CustomButtonStyles.fillPrimary, onTap: () {onTapContinuewith1();}), Padding(padding: getPadding(left: 41, top: 26, right: 41), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(padding: getPadding(bottom: 1), child: Text("msg_don_t_have_an_account".tr, style: CustomTextStyles.titleMediumBluegray300)), GestureDetector(onTap: () {onTapTxtLargelabelmediu();}, child: Padding(padding: getPadding(left: 2), child: Text("lbl_sign_up".tr, style: theme.textTheme.titleMedium)))])), Container(width: getHorizontalSize(245), margin: getMargin(left: 40, top: 84, right: 40, bottom: 5), 
// child: RichText(text: TextSpan(children: [TextSpan(text: "msg_by_signing_up_you2".tr, style: CustomTextStyles.titleSmallBluegray400SemiBold), TextSpan(text: "lbl_terms".tr, style: CustomTextStyles.titleSmallErrorContainer), TextSpan(text: "lbl_and".tr, style: CustomTextStyles.titleSmallBluegray400SemiBold), TextSpan(text: "msg_conditions_of_use".tr, style: CustomTextStyles.titleSmallErrorContainer)]), textAlign: TextAlign.center
// )
// )]
// )
// )
// )
// )
// ); } 


// /// Navigates to the previous screen.
// ///
// /// When the action is triggered, this function uses the [Get] package to 
// /// navigate to the previous screen in the navigation stack.
// onTapImgImage() { Get.back(); } 
// /// Performs a Google sign-in and returns a [GoogleUser] object.
// ///
// /// If the sign-in is successful, the [onSuccess] callback will be called with
// /// a TODO comment needed to be modified by you.
// /// If the sign-in fails, the [onError] callback will be called with the error message.
// ///
// /// Throws an exception if the Google sign-in process fails.
// onTapContinuewith() async  {         await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
//           if(googleUser!=null){
//             //TODO Actions to be performed after signin
//           } else {
//             Get.snackbar('Error', 'user data is empty');
//           }
//         }).catchError((onError) {
//             Get.snackbar('Error', onError.toString());
//         });
//          } 
// /// Navigates to the enterOtpScreen when the action is triggered.

// /// When the action is triggered, this function uses the [Get] package to
// /// push the named route for the enterOtpScreen.
// onTapContinuewith1(){
//   LoginViewModel();
// }
  
// // onTapContinuewith1() { Get.toNamed(AppRoutes.enterOtpScreen, ); } 
// /// Navigates to the signUpCreateAcountScreen when the action is triggered.

// /// When the action is triggered, this function uses the [Get] package to
// /// push the named route for the signUpCreateAcountScreen.
// onTapTxtLargelabelmediu() { Get.toNamed(AppRoutes.signUpCreateAcountScreen, ); } 
//  }
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( 
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 13, 55, 90),
        foregroundColor: Colors.white,
      ), 
      // appBar: AppBar(title: const Text('Login',
      // style: TextStyle(
      //     color: Colors.black, // Set the color you want for the text
      //   ),
      // ),
      // centerTitle: true,
      // ),
      body: SingleChildScrollView( 
          child: loginForm()),
    );
  }



  Widget loginForm() {
    return Container(
    color: Colors.white,
    child: Form(
      
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
      children: <Widget>[ 
            Padding( 
              padding: const EdgeInsets.only(top: 110.0), 
              child: Center( 
                child: Container( 
                    width: 200, 
                    height: 100, 
                    child: Image.asset('assets/images/img_group162797.png')), 
              ), 
            ), 
            TextFormField(
              controller: emailCtr,
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Please Enter Email'
                    : null;
              },
              decoration: inputDecoration('E-mail', Icons.person),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Please Enter Password'
                    : null;
              },
              controller: passwordCtr,
              decoration: inputDecoration('Password', Icons.lock),
            ),
           
            SizedBox( 
            height: 65, 
            width: 360, 
            child: Container( 
                child: Padding( 
                  padding: const EdgeInsets.only(top: 20.0), 
                  child: ElevatedButton( 
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 13, 55, 90), 
                    ),
                    onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {
                          await _viewModel.loginUser(emailCtr.text, passwordCtr.text);
                          print('Successfully log in '); 
                        }
                      },
                    child: Text( 'Log in ', style: TextStyle(color: Colors.white, fontSize: 20), 
                    ), 
                  ), 
                ), 
              ), 
          ),  
      ],
      ),
     ),
    );
  }
}





InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.black),
    fillColor: Colors.white,
    
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black)),
    errorStyle: TextStyle(color: Colors.blueGrey),
  );
}

enum FormType { login, register }




class LoginService extends GetConnect {
  final String loginUrl =
      'https://erp.teamproit.com/api/method/login';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    var token = '';
    final response = await post(
      loginUrl,
      model.toJson(),
    );
    if (response.statusCode == HttpStatus.ok) {
      response.headers?.forEach((key, value) {
        if (key == 'set-cookie') {
          token = value;
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
    final response = await _loginService
        .fetchLogin(LoginRequestModel(usr: email, pwd: password));
    if (response != null) {
      _authManager.login(response.token);
      // Get.toNamed(AppRoutes.jobDetailsTabContainerScreen, );
      Get.toNamed(AppRoutes.jobTypeScreen);
      // Get.toNamed('jobpro/presentation/job_details/controller/job_details_controller.dart',);
    } else {
      Get.defaultDialog(
        backgroundColor: Colors.white,
           content: RichText(
            text: TextSpan(
              text: 'User not found!',
              style: TextStyle(
                color: Colors.red, 
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
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
