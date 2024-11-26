import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:jobpro/presentation/reset_password/reset_password.dart';
import 'package:jobpro/utils/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/core/utils/validation_functions.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:jobpro/widgets/custom_text_form_field.dart';

import 'package:jobpro/utils/authentication_manager.dart';
class LoginScreenOtp extends StatefulWidget {
  LoginScreenOtp({Key? key}) : super(key: key);
  
  @override
  _LoginViewState createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginScreenOtp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());
  TextEditingController phonectr=TextEditingController();
  // TextEditingController emailCtr = TextEditingController();
  // TextEditingController passwordCtr = TextEditingController();
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
                      "Phone Number",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                // CustomTextFormField(
                //   controller: phonectr,
                //   margin: getMargin(top: 5),
                //   hintText: "Enter your Phone Number",
                //   hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139),fontSize: 12),
              
                //   textInputAction: TextInputAction.done,
                //   textInputType: TextInputType.phone,
                //   textStyle: TextStyle(color: const Color.fromRGBO(0, 0, 0, 1)),
                //   validator: (value) {
                //     if (value == null || (!isValidEmail(value, isRequired: true))) {
                //       return "<b>Please enter valid phone number</b>";
                //     }
                    
                //     return null;
                //   },
                //   contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
                  
                // ),
                CustomTextFormField(
                  controller: phonectr,
                  margin: getMargin(top: 5),
                  hintText: "Enter your Phone Number",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139),fontSize: 12),
              
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.phone,
                  textStyle: TextStyle(color: const Color.fromRGBO(0, 0, 0, 1)),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "<b>Please enter valid phone number<b>";
                    }
                    
                    return null;
                  },
                  contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
                  
                ),
                CustomElevatedButton(
                  text: "Send OTP",
                  margin: getMargin(top: 20),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  onTap: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await _viewModel.loginUser(phonectr.text);                          
                        }
                        
                      },
                ),            
                // CustomElevatedButton(
                  
                //   text: "Send OTP",
                //   // child: Text(
                //   //     "Phone Number",
                //   //     style: theme.textTheme.titleSmall,
                //   //   ),
                //   margin: getMargin(top: 40),
                //   // buttonStyle: ElevatedButton.styleFrom(
                //   //     primary: theme.colorScheme.primary, // Set the background color
                //   //     shape: RoundedRectangleBorder(
                //   //       borderRadius: BorderRadius.circular(getHorizontalSize(42.00)),
                        
                //   //     ),
                //   //     minimumSize: Size(30, 50), // Width and height of the button
                //   //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                //   //   ),
                //     onTap: () async {
                //         if (_formKey.currentState?.validate() ?? false) {
                //           await _viewModel.loginUser(phonectr.text);                          
                //         }
                        
                //       },
                // ),
                
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
class LoginResponseModel {
  String? token;

  LoginResponseModel({this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
class LoginRequestModel {
  String? mobile;


  LoginRequestModel({this.mobile});

  Map toJson() {
    final Map data = new Map();
    data['mobile'] = this.mobile;
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

  Future<String> loginUser(String phone) async {
    print(phone);
    
    final response = await _loginService
        .fetchLogin(LoginRequestModel(mobile: phone));
        print(response);
    if (response != null) {
    // _authManager.login(phone);
      
      print(phone); 
      Get.toNamed(AppRoutes.enterOtpScreen, arguments: {'phone': phone,'otp': response.token!});
      // Get.toNamed(AppRoutes.enterOtpScreen);
      return response.token!;
    } else {
      Get.defaultDialog(
        backgroundColor: Colors.white,
           content: RichText(
            text: TextSpan(
              text: 'Not a valid phone number!',
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
          return "null";
    }
  }
}

class LoginService extends GetConnect {
  final String loginUrl =
      'https://erp.teamproit.com/api/method/jobpro.jobpro_web.otp_request';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    var token = '';
    print(loginUrl);
    print(model.toJson());
    final response = await post(
      loginUrl,
      model.toJson(),
    );
    print(response);
    if (response.statusCode == HttpStatus.ok) {
      // var data = json.decode(response.body);
      response.body?.forEach((key, value) {
        if (key == 'message') {
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
