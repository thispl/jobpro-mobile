
import 'package:jobpro/presentation/login_screen/splash.dart';

import 'controller/sign_up_create_acount_controller.dart';import 'package:flutter/material.dart';import 'package:jobpro/core/app_export.dart';import 'package:jobpro/core/utils/validation_functions.dart';import 'package:jobpro/widgets/custom_elevated_button.dart';import 'package:jobpro/widgets/custom_outlined_button.dart';import 'package:jobpro/widgets/custom_text_form_field.dart';import 'package:jobpro/domain/googleauth/google_auth_helper.dart';
// ignore_for_file: must_be_immutable
class SignUpCreateAcountScreen extends GetWidget<SignUpCreateAcountController> {SignUpCreateAcountScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, backgroundColor: appTheme.whiteA70002, body: Form(key: _formKey, child: Container(width: double.maxFinite, padding: getPadding(left: 24, top: 13, right: 24, bottom: 13), child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [CustomImageView(svgPath: ImageConstant.imgGroup162799, height: getSize(24), width: getSize(24), alignment: Alignment.centerLeft, onTap: () {onTapImgImage();}), Padding(padding: getPadding(top: 44), child: Text("lbl_create_account".tr, style: theme.textTheme.headlineSmall)), Padding(padding: getPadding(top: 11), child: Text("msg_lorem_ipsum_dolor".tr, style: CustomTextStyles.titleMediumBluegray400)), CustomOutlinedButton(height: getVerticalSize(56), text: "msg_continue_with_google".tr, margin: getMargin(top: 28), leftIcon: Container(margin: getMargin(right: 12), child: CustomImageView(svgPath: ImageConstant.imgGooglesymbol1)), buttonStyle: CustomButtonStyles.outlinePrimary, buttonTextStyle: theme.textTheme.titleMedium!, onTap: () {onTapContinuewith();}), CustomOutlinedButton(height: getVerticalSize(56), text: "msg_continue_with_apple".tr, margin: getMargin(top: 16), leftIcon: Container(margin: getMargin(right: 12), child: CustomImageView(svgPath: ImageConstant.imgIconApple)), buttonStyle: CustomButtonStyles.outlinePrimary, buttonTextStyle: theme.textTheme.titleMedium!), Padding(padding: getPadding(left: 33, top: 26, right: 33), child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: getPadding(top: 8, bottom: 8), child: SizedBox(width: getHorizontalSize(62), child: Divider())), Padding(padding: getPadding(left: 12), child: Text("msg_or_continue_with".tr, style: CustomTextStyles.titleSmallBluegray300)), Padding(padding: getPadding(top: 8, bottom: 8), child: SizedBox(width: getHorizontalSize(74), child: Divider(indent: getHorizontalSize(12))))])), Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(top: 28), child: Text("lbl_email".tr, style: CustomTextStyles.titleSmallPrimary))), CustomTextFormField(controller: controller.emailController, margin: getMargin(top: 9), hintText: "msg_enter_your_email".tr, hintStyle: CustomTextStyles.titleMediumBluegray400, textInputAction: TextInputAction.done, textInputType: TextInputType.emailAddress, validator: (value) {if (value == null || (!isValidEmail(value, isRequired: true))) {return "Please enter valid email";} return null;}, contentPadding: getPadding(left: 12, top: 15, right: 12, bottom: 15)), CustomElevatedButton(text: "msg_continue_with_email".tr, margin: getMargin(top: 40), buttonStyle: CustomButtonStyles.fillPrimary, onTap: () {onTapContinuewith1();}), Padding(padding: getPadding(left: 40, top: 28, right: 40), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("msg_already_have_an".tr, style: CustomTextStyles.titleMediumBluegray300), GestureDetector(onTap: () {onTapTxtLargelabelmediu();}, child: Padding(padding: getPadding(left: 3), child: Text("lbl_login".tr, style: theme.textTheme.titleMedium)))])), Container(width: getHorizontalSize(245), margin: getMargin(left: 40, top: 84, right: 40, bottom: 5), child: RichText(text: TextSpan(children: [TextSpan(text: "msg_by_signing_up_you2".tr, style: CustomTextStyles.titleSmallBluegray400SemiBold), TextSpan(text: "lbl_terms".tr, style: CustomTextStyles.titleSmallErrorContainer), TextSpan(text: "lbl_and".tr, style: CustomTextStyles.titleSmallBluegray400SemiBold), TextSpan(text: "msg_conditions_of_use".tr, style: CustomTextStyles.titleSmallErrorContainer)]), textAlign: TextAlign.center))]))))); } 


/// Navigates to the previous screen.
///
/// When the action is triggered, this function uses the [Get] package to 
/// navigate to the previous screen in the navigation stack.
onTapImgImage() { Get.back(); } 
/// Performs a Google sign-in and returns a [GoogleUser] object.
///
/// If the sign-in is successful, the [onSuccess] callback will be called with
/// a TODO comment needed to be modified by you.
/// If the sign-in fails, the [onError] callback will be called with the error message.
///
/// Throws an exception if the Google sign-in process fails.
onTapContinuewith() async  {         await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
          if(googleUser!=null){
            //TODO Actions to be performed after signin
          } else {
            Get.snackbar('Error', 'user data is empty');
          }
        }).catchError((onError) {
            Get.snackbar('Error', onError.toString());
        });
         } 
/// Navigates to the signUpCompleteAccountScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the signUpCompleteAccountScreen.
onTapContinuewith1() { Get.toNamed(AppRoutes.signUpCompleteAccountScreen, ); } 
/// Navigates to the loginScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the loginScreen.
onTapTxtLargelabelmediu() {Get.toNamed(AppRoutes.loginScreen, );}
 }
