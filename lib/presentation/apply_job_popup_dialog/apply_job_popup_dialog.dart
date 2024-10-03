import 'controller/apply_job_popup_controller.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';

class ApplyJobPopupDialog extends StatelessWidget {
  ApplyJobPopupDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  ApplyJobPopupController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(302),
      padding: getPadding(
        all: 32,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgThumbsup11,
            height: getSize(101),
            width: getSize(101),
          ),
          Padding(
            padding: getPadding(
              top: 25,
            ),
            child: Text(
              "lbl_success".tr,
              style: CustomTextStyles.titleMediumBold,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 9,
            ),
            child: Text(
              "msg_your_application".tr,
              style: CustomTextStyles.titleSmallBluegray400,
            ),
          ),
          CustomElevatedButton(
            height: getVerticalSize(46),
            width: getHorizontalSize(127),
            text: "lbl_continue".tr,
            margin: getMargin(
              top: 23,
            ),
            buttonStyle: CustomButtonStyles.fillPrimaryTL20,
            buttonTextStyle: CustomTextStyles.titleSmallGray5001,
          ),
        ],
      ),
    );
  }
}
