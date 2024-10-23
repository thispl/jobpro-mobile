import 'dart:convert';
import 'dart:io'; // Import for HttpStatus
import 'package:http/http.dart'; // Ensure you import the http package
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/core/utils/validation_functions.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:jobpro/widgets/custom_text_form_field.dart';
import 'controller/sign_up_create_acount_controller.dart';

// ignore_for_file: must_be_immutable
class SignUpCreateAcountScreen extends GetWidget<SignUpCreateAcountController> {
  SignUpCreateAcountScreen({Key? key}) : super(key: key);
  
  // Define TextEditingControllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA70002,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(left: 24, top: 13, right: 24, bottom: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  padding: getPadding(top: 44),
                  child: Text(
                    "lbl_create_account".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: getPadding(top: 11),
                  child: Text(
                    "Sign Up Page",
                    style: CustomTextStyles.titleMediumBluegray400,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 28),
                    child: Text(
                      "lbl_first_name".tr,
                      style: CustomTextStyles.titleSmallPrimary,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: firstNameController,
                  margin: getMargin(top: 9),
                  hintText: "msg_enter_your_first".tr,
                  hintStyle: CustomTextStyles.titleMediumBluegray400,
                  textStyle: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (!isText(value)) {
                      return "Please enter valid text";
                    }
                    return null;
                  },
                  contentPadding: getPadding(left: 12, top: 15, right: 12, bottom: 5),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 28),
                    child: Text(
                      "lbl_last_name".tr,
                      style: CustomTextStyles.titleSmallPrimary,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: lastNameController,
                  margin: getMargin(top: 9),
                  hintText: "msg_enter_your_last".tr,
                  hintStyle: CustomTextStyles.titleMediumBluegray400,
                  textStyle: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (!isText(value)) {
                      return "Please enter valid text";
                    }
                    return null;
                  },
                  contentPadding: getPadding(left: 12, top: 15, right: 12, bottom: 5),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 28),
                    child: Text(
                      "lbl_email".tr,
                      style: CustomTextStyles.titleSmallPrimary,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: emailCtr,
                  margin: getMargin(top: 9),
                  hintText: "msg_enter_your_email".tr,
                  hintStyle: CustomTextStyles.titleMediumBluegray400,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  textStyle: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || (!isValidEmail(value, isRequired: true))) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                  contentPadding: getPadding(left: 12, top: 15, right: 12, bottom: 5),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(top: 28),
                    child: Text(
                      "Password",
                      style: CustomTextStyles.titleSmallPrimary,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: passwordCtr,
                  margin: getMargin(top: 9),
                  hintText: "Enter your Password",
                  hintStyle: CustomTextStyles.titleMediumBluegray400,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  textStyle: TextStyle(color: Colors.black),
                  obscureText: true, // Hide password input
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter valid password";
                    }
                    return null;
                  },
                  contentPadding: getPadding(left: 12, top: 15, right: 12, bottom: 5),
                ),
                CustomElevatedButton(
                  text: "Sign Up",
                  margin: getMargin(top: 20),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  onTap: () async {
                    // if (_formKey.currentState?.validate() ?? false) {
                      // Only call the function if the form is valid
                      String? message = await onTapContinuewith1(
                        firstNameController.text,  // Corrected
                        lastNameController.text,   // Corrected
                        emailCtr.text,             // Corrected
                        passwordCtr.text,          // Corrected
                      );
                       if (message != null) {
                          Get.snackbar('Message', message); // Show success message
                        }
                    // }
                  },
                ),
                Padding(
                  padding: getPadding(left: 40, top: 28, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "msg_already_have_an".tr,
                        style: CustomTextStyles.titleMediumBluegray300,
                      ),
                      GestureDetector(
                        onTap: () {
                          onTapTxtLargelabelmediu();
                        },
                        child: Padding(
                          padding: getPadding(left: 3),
                          child: Text(
                            "lbl_login".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: getHorizontalSize(245),
                  margin: getMargin(left: 40, top: 64, right: 40, bottom: 1),
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
  
  Future<String?> onTapContinuewith1(
      String firstName,
      String lastName,
      String emailCtr,
      String password) async {
    String userurl = 'https://erp.teamproit.com/api/method/teampro.api.create_new_user';
    String apiKey = '4aedf12d2330fbe';
    String apiSecret = '2d72f01e8e1a60a';
    String token = 'token $apiKey:$apiSecret';
    print(password);
    // Create request body
    var body = json.encode({
      "first_name": firstName,
      "last_name": lastName,
      'email': emailCtr,
      "password": password,
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
