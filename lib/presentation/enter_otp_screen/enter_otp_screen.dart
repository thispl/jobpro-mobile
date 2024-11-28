// // import 'controller/enter_otp_controller.dart';
// // import 'package:flutter/material.dart';
// // import 'package:jobpro/core/app_export.dart';
// // import 'package:jobpro/widgets/custom_elevated_button.dart';
// // import 'package:jobpro/widgets/custom_pin_code_text_field.dart';

// // class EnterOtpScreen extends GetWidget<EnterOtpController> {const EnterOtpScreen({Key? key}) : super(key: key);

// // @override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, backgroundColor: appTheme.whiteA70001, body: Container(width: double.maxFinite, padding: getPadding(left: 24, top: 13, right: 24, bottom: 13), child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [CustomImageView(svgPath: ImageConstant.imgGroup162799, height: getSize(24), width: getSize(24), alignment: Alignment.centerLeft, onTap: () {onTapImgImage();}), Padding(padding: getPadding(top: 44), child: Text("lbl_enter_otp".tr, style: theme.textTheme.headlineSmall)), Container(width: getHorizontalSize(282), margin: getMargin(left: 22, top: 10, right: 22), child: RichText(text: TextSpan(children: [TextSpan(text: "msg_we_have_just_sent2".tr, style: CustomTextStyles.titleSmallBluegray400_3), TextSpan(text: "msg_example_gmail_com".tr, style: CustomTextStyles.titleSmallPrimary_1)]), textAlign: TextAlign.center)), Obx(() => CustomPinCodeTextField(context: context, margin: getMargin(left: 16, top: 38, right: 15), controller: controller.otpController.value, onChanged: (value) {})), CustomElevatedButton(text: "lbl_continue".tr, margin: getMargin(top: 40), buttonStyle: CustomButtonStyles.fillPrimary, onTap: () {onTapContinue();}), Padding(padding: getPadding(left: 30, top: 26, right: 30, bottom: 5), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("msg_didn_t_receive_code".tr, style: CustomTextStyles.titleMediumBluegray300), Text("lbl_resend_code".tr, style: theme.textTheme.titleMedium)]))])))); } 


// // /// Navigates to the previous screen.
// // ///
// // /// When the action is triggered, this function uses the [Get] package to 
// // /// navigate to the previous screen in the navigation stack.
// // onTapImgImage() { Get.back(); } 
// // /// Navigates to the jobTypeScreen when the action is triggered.

// // /// When the action is triggered, this function uses the [Get] package to
// // /// push the named route for the jobTypeScreen.
// // onTapContinue() { Get.toNamed(AppRoutes.jobTypeScreen, ); } 
// //  }


// import 'package:jobpro/utils/authentication_manager.dart';

// import 'controller/enter_otp_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:jobpro/core/app_export.dart';
// import 'package:jobpro/widgets/custom_elevated_button.dart';
// import 'package:jobpro/widgets/custom_pin_code_text_field.dart';

// class EnterOtpScreen extends StatelessWidget {
//   EnterOtpScreen({Key? key}) : super(key: key);
//   final AuthenticationManager _authManager = Get.put(AuthenticationManager());
//   Rx<TextEditingController> otpController = TextEditingController().obs;
//   String ?token;

//   @override
//   Widget build(BuildContext context) {
//     token = _authManager.getToken()!;
//     mediaQueryData = MediaQuery.of(context);

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: appTheme.whiteA70001,
//         body: Container(
//           width: double.maxFinite,
//           padding: getPadding(left: 24, top: 13, right: 24, bottom: 13),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               CustomImageView(
//                 svgPath: ImageConstant.imgGroup162799,
//                 height: getSize(24),
//                 width: getSize(24),
//                 alignment: Alignment.centerLeft,
//                 onTap: () {
//                   onTapImgImage();
//                 },
//               ),
//               Padding(
//                 padding: getPadding(top: 44),
//                 child: Text(
//                   "lbl_enter_otp".tr,
//                   style: theme.textTheme.headlineSmall,
//                 ),
//               ),
//               Container(
//                 width: getHorizontalSize(282),
//                 margin: getMargin(left: 22, top: 10, right: 22),
//                 child: RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "msg_we_have_just_sent2".tr,
//                         style: CustomTextStyles.titleSmallBluegray400_3,
//                       ),
//                       TextSpan(
//                         text: token,
//                         style: CustomTextStyles.titleSmallPrimary_1,
//                       ),
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Obx(
//                 () => CustomPinCodeTextField(
//                   context: context,
//                   margin: getMargin(left: 16, top: 38, right: 15),
//                   controller: otpController.value,
//                   onChanged: (value) {},
//                 ),
//               ),
//               CustomElevatedButton(
//                 text: "lbl_continue".tr,
//                 margin: getMargin(top: 40),
//                 buttonStyle: CustomButtonStyles.fillPrimary,
//                 onTap: () {
//                   print(otpController.value);
//                   // onTapContinue();
//                 },
//               ),
//               Padding(
//                 padding: getPadding(left: 30, top: 26, right: 30, bottom: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "msg_didn_t_receive_code".tr,
//                       style: CustomTextStyles.titleMediumBluegray300,
//                     ),
//                     Text(
//                       "lbl_resend_code".tr,
//                       style: theme.textTheme.titleMedium,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Navigates to the previous screen.
//   ///
//   /// When the action is triggered, this function uses the [Get] package to
//   /// navigate to the previous screen in the navigation stack.
//   onTapImgImage() {
//     Get.back();
//   }

//   /// Navigates to the jobTypeScreen when the action is triggered.
//   ///
//   /// When the action is triggered, this function uses the [Get] package to
//   /// push the named route for the jobTypeScreen.
//   onTapContinue() {
//     Get.toNamed(AppRoutes.jobTypeScreen);
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobpro/api/firebase_api.dart';
import 'package:jobpro/api/firebase_api.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/core/utils/image_constant.dart';
import 'package:jobpro/core/utils/size_utils.dart';
import 'package:jobpro/presentation/login_screen_otp/login_screen_otp.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:jobpro/widgets/custom_image_view.dart';
import 'package:otp_input_editor/otp_input_editor.dart';
import 'package:http/http.dart' as http;
import 'package:jobpro/utils/authentication_manager.dart';

class EnterOtpScreen extends StatefulWidget {
  EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<EnterOtpScreen> {
  String _otpData = "";
  String org_otp_new='';
  
  String phone = Get.arguments['phone'];
  String org_otp = Get.arguments['otp'];
  final FirebaseApi device_token = Get.put(FirebaseApi());
  OtpInputController? _otpInputController;
  bool _showOtp = true;
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  // final firebaseApi = FirebaseApi();
  
  String maskedPhone = Get.arguments['phone'].length > 6 
    ? Get.arguments['phone'].substring(0, 6) + '*' * (Get.arguments['phone'].length - 6) 
    : Get.arguments['phone']; // Show full phone if shorter than 6 digits
  LoginViewModel _viewModel = Get.put(LoginViewModel());
  Future<void> verifyOtpAndDisplayMessage(String orgOtp, String otpData, String phone, String device_id) async {
    String _otpMessage = "";
    String message = await verifyotp(orgOtp, otpData, phone,device_id);
      ;

    setState(() {
      _otpMessage = message; // Update the message to display it on the screen
    });

    if (message == 'Invalid OTP') {
      print("Invalid OTP");
      // Display a Snackbar with the invalid message
      Get.snackbar('Error', 'Invalid OTP', snackPosition: SnackPosition.TOP);
    } else if (message == 'Redirecting to sign-up') {
      print("Redirecting to sign-up");
    } else {
      print(message);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body:
      //  Center(
        Padding(
          padding: getPadding(left: 28,right: 28),
// //           
          child: Column(
            children: [
              ..._getOtpText,
              
              Container(
                width: getHorizontalSize(282),
                margin: getMargin(left: 22, right: 22, bottom: 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "msg_we_have_just_sent2".tr,
                        style: CustomTextStyles.titleSmallBluegray400_3,
                      ),
                      TextSpan(
                        text: maskedPhone,
                        style: CustomTextStyles.titleSmallPrimary_1,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
                      
              _getOtpEditor,
              _spacer,
              _clearOtpButton,
              // _hideOrShowButton,
              SizedBox(
                height: 5,
              ),
              // if (_otpMessage.isNotEmpty)
              // Padding(
              //   padding: const EdgeInsets.only(top: 20.0),
              //   child: Text(
              //     _otpMessage,
              //     style: TextStyle(fontSize: 14, color: Colors.red),
              //   ),
              // ),
              CustomElevatedButton(
                text: "lbl_continue".tr,
                margin: getMargin(top: 10),
                buttonStyle: CustomButtonStyles.fillPrimary,
                onTap: () async {
                  print(_otpData);
                  print(phone);
                  print(org_otp);
                  // String final_otp = org_otp_new ?? org_otp;
                  String final_otp = (org_otp_new != null && org_otp_new.isNotEmpty) ? org_otp_new : org_otp;
                  print(final_otp);
                  await device_token.initNotifications(); // Ensure notifications are initialized
                  String? device_id = device_token.getFcmToken();

                  print("Device ID :$device_id");
                  // verifyOtpAndDisplayMessage(org_otp, _otpData, phone);
                  String message = await verifyotp(final_otp, _otpData, phone,device_id);
                  print(message);
                  if (message == 'Invalid OTP') {
                    Get.snackbar('Error', 'Invalid OTP', snackPosition: SnackPosition.TOP);
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  );
                  }

                  
                  
                  // onTapContinue();
                },
              ),
              
              Padding(
                padding: getPadding(left: 30, top: 26, right: 30, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "msg_didn_t_receive_code".tr,
                      style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 184, 172, 171)),
                    ),
                   TextButton(
                      onPressed: () async {
                        // await _viewModel.loginUser(phone);
                         _otpInputController!.clear();

                          String org_otp_new=await _viewModel.loginUser(phone);
                      },
                      child: Text(
                        "lbl_resend_code".tr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        // ),
      ),
    );
  }

  SizedBox get _spacer {
    return const SizedBox(
      height: 5,
    );
  }

  Row get _hideOrShowButton {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                _showOtp = !_showOtp;
              });
            },
            child: Row(
              children: _showOtp
                  ? [
                      const Icon(Icons.visibility_off),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("Hide"),
                      )
                    ]
                  : [
                      const Icon(Icons.visibility),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("Show"),
                      )
                    ],
            )),
      ],
    );
  }

  Row get _clearOtpButton {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            if (_otpInputController != null) {
              _otpInputController!.clear();
              _otpData = _otpInputController?.otp ?? "";
              setState(() {});
            }
          },
          child: const Text(
            "Clear OTP",
            style: TextStyle(
              color: Color.fromARGB(255, 7, 27, 43),
              fontSize: 14,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  OtpInputEditor get _getOtpEditor {
    return OtpInputEditor(
      obscureText: !_showOtp,
      otpLength: 6,
      onOtpChanged: (value) {
        print(value);
        setState(() {
          _otpData = value;
        });
      },
      onInitialization: (OtpInputController otpInputController) {
        setState(() {
          _otpInputController = otpInputController;
        });
      },
      invalid: false,
      otpTextFieldBackgroundColor: Colors.white,
      cursorHeight: 25,
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 2.0,
          spreadRadius: 2.0,
        ),
      ],
      fieldWidth: 40.0,
      fieldHeight: 40.0,
      cursorWidth: 1.5,
      textInputStyle: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      boxDecoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 65, 65, 65),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
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
                  // onTapImgImage();
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
        );
  }

  List<Widget> get _getOtpText {
    return 
      [Padding(
        padding: getPadding(top:50),
        child: Text(
          "lbl_enter_otp".tr,
          style: theme.textTheme.headlineSmall,
        ),
      ),
  
      const SizedBox(
        height: 10,
      ),

      const SizedBox(
        height: 30,
      ),
    ];
  }

Future<String> verifyotp(String orgOtp, String otpData, String phone, String device_id) async {
  final Uri url = Uri.parse(
      'https://erp.teamproit.com/api/method/teampro.api.otp_verification?otpSent=$orgOtp&otpValue=$otpData&mobile=$phone&device_id=$device_id');
  try {
    print(phone);

    // Prepare the request
    var request = http.Request('POST', url);

    // Send the request
    var response = await request.send();
  
    if (response.statusCode == 200) {
      // Parse the response body
      print('Response Body: ${response.statusCode}');
      var responseBody = await response.stream.bytesToString();
      var data = json.decode(responseBody);
      print('Response Body: $data');
      if(data['message']=='invalid'){
        
        return "Invalid OTP";
      }
      else if(data['message']=='user not found'){
        Get.toNamed(AppRoutes.signUpCreateAcountScreen,arguments: {'phone': phone});
        return 'Redirecting to sign-up';
      }
      else{
         _authManager.login(data['message']);
         Get.toNamed(AppRoutes.jobDetails);
      }
      
      
      
      return data['message'] ?? 'Verification successful';
    } else {
      print('Error: ${response.headers}');
      return 'Error: ${response.statusCode}';
    }
  } catch (e) {
    print("Error uploading file: $e");
    return 'Error: $e';
  }
}
}