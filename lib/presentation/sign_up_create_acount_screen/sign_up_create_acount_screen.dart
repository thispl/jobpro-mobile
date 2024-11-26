import 'dart:convert';
import 'dart:io'; // Import for HttpStatus
import 'package:http/http.dart'; // Ensure you import the http package
import 'package:flutter/material.dart';
import 'package:jobpro/api/firebase_api.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/core/utils/validation_functions.dart';
import 'package:jobpro/utils/authentication_manager.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:jobpro/widgets/custom_text_form_field.dart';
import 'controller/sign_up_create_acount_controller.dart';

// ignore_for_file: must_be_immutable
class SignUpCreateAcountScreen extends StatefulWidget {
  @override
  _SignUpCreateAcountScreenState createState() => _SignUpCreateAcountScreenState();
}

class _SignUpCreateAcountScreenState extends State<SignUpCreateAcountScreen> {
// class SignUpCreateAcountScreen extends GetWidget<SignUpCreateAcountController> {
//   SignUpCreateAcountScreen({Key? key}) : super(key: key);
  
  // Define TextEditingControllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phonectr=TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  String phone = Get.arguments['phone'];
  bool isPasswordHidden = true;
  final FirebaseApi device_token = Get.put(FirebaseApi());
  


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
void initState() {
    // super.initState();
    // Set the phone number to the controller's text when the widget initializes
    phonectr.text = Get.arguments['phone'] ?? '';
  }
  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA70002,
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
            padding: getPadding(left: 24,right: 24, bottom: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(top:10),
                  child: Text(
                    "lbl_create_account".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: getPadding(top: 7),
                  child: Text(
                    "Sign Up Page",
                    style: CustomTextStyles.titleMediumBluegray400,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 20),
                    child: Text(
                      "lbl_first_name".tr,
                      style: CustomTextStyles.titleSmallPrimary,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: firstNameController,
                  margin: getMargin(top: 5),
                  hintText: "msg_enter_your_first".tr,
                  hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139),fontSize: 12),
                  textStyle: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (!isText(value)) {
                      return "Please enter valid text";
                    }
                    return null;
                  },
                  contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 20),
                    child: Text(
                      "lbl_last_name".tr,
                      style: CustomTextStyles.titleSmallPrimary,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: lastNameController,
                  margin: getMargin(top: 5),
                  hintText: "msg_enter_your_last".tr,
                  hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139),fontSize: 12),
                  textStyle: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (!isText(value)) {
                      return "Please enter valid text";
                    }
                    return null;
                  },
                  contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
                ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: getPadding(top: 20),
                //     child: Text(
                //       "Phone Number",
                //       style: theme.textTheme.titleSmall,
                //     ),
                //   ),
                // ),
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
                //       return "<b>Please enter valid phone number";
                //     }
                    
                //     return null;
                //   },
                //   contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
                  
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 20),
                    child: Text(
                      "lbl_email".tr,
                      style: CustomTextStyles.titleSmallPrimary,
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
                  textStyle: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || (!isValidEmail(value, isRequired: true))) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                  contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 20),
                    child: Text(
                      "Password (should include special characters, uppercase, and lowercase letters)",
                      style: CustomTextStyles.titleSmallPrimary,
                    ),
                  ),
                ),
                Stack(
  alignment: Alignment.centerRight,
  children: [
    CustomTextFormField(
      controller: passwordCtr,
      margin: getMargin(top: 5),
      hintText: "Enter your Password",
      hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139), fontSize: 12),
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      textStyle: TextStyle(color: Colors.black),
      obscureText: isPasswordHidden,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a valid password";
        }
        return null;
      },
      contentPadding: getPadding(left: 7, top: 7, right: 7, bottom: 7),
    ),
    IconButton(
      icon: Icon(
        isPasswordHidden ? Icons.visibility_off : Icons.visibility,
        color: const Color.fromARGB(255, 31, 31, 31),
      ),
      onPressed: () {
        setState(() {
          isPasswordHidden = !isPasswordHidden;
        });
      },
    ),
  ],
),
                CustomElevatedButton(
                  text: "Sign Up",
                  margin: getMargin(top: 20),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  onTap: () async {
                    await device_token.initNotifications(); // Ensure notifications are initialized
                  String? device_id = device_token.getFcmToken();
                    // if (_formKey.currentState?.validate() ?? false) {
                      // Only call the function if the form is valid
                      String? message = await onTapContinuewith1(
                        firstNameController.text,  // Corrected
                        lastNameController.text,
                        phone,   // Corrected
                        emailCtr.text,             // Corrected
                        passwordCtr.text, 
                        device_id,
                                // Corrected
                      );
                       if (message != null) {
                        print("hiiii");
                          Get.snackbar('Message', message);
                          _authManager.login(emailCtr.text);
                          Get.toNamed(AppRoutes.jobDetails); // Show success message
                        }
                    // }
                  },
                ),
                // Padding(
                //   padding: getPadding(left: 30, top: 20, right: 30),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "msg_already_have_an".tr,
                //         style: CustomTextStyles.titleSmallBluegray300,
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           onTapTxtLargelabelmediu();
                //         },
                //         child: Padding(
                //           padding: getPadding(left: 3),
                //           child: Text(
                //             "lbl_login".tr,
                //             style: theme.textTheme.titleSmall,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  width: getHorizontalSize(245),
                  margin: getMargin(left: 40, top: 34, right: 40, bottom: 1),
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

  void onTapImgImage() {
    Get.back();
  }
  // @override
  // void dispose() {
  //   passwordCtr.dispose();
  //   super.dispose();
  // }
  Future<String?> onTapContinuewith1(
      String firstName,
      String lastName,
      String phoneno,
      String emailCtr,
      String password,
      String device_id) async {
    String userurl = 'https://erp.teamproit.com/api/method/teampro.api.create_new_user';
    String apiKey = 'daa4a43f429c844';
    String apiSecret = '3b0d3fbc3c5e4ce';
    String token = 'token $apiKey:$apiSecret';
    print(password);
    // Create request body
    var body = json.encode({
      "first_name": firstName,
      "last_name": lastName,
      "phone" : phoneno,
      'email': emailCtr,
      "password": password,
      "device_id":device_id
    });

    // Send POST request
    var response = await post(
      Uri.parse(userurl),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: body,
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    // Check response status
    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.body);
      print(data);
      
      return data['message'];
    } else {
      Get.snackbar('Error', 'Status Code: ${response.statusCode}');
      return null; // Return null if the request was not successful
    }
  }

  void onTapTxtLargelabelmediu() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}
