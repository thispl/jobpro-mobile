import 'controller/job_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:jobpro/widgets/custom_icon_button.dart';

class JobTypeScreen extends GetWidget<JobTypeController> {
  const JobTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        body: Container(
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
                padding: getPadding(top: 47),
                child: Text(
                  "lbl_choose_job_type".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              Container(
                width: getHorizontalSize(209),
                margin: getMargin(top: 7),
                child: Text(
                  "msg_are_you_looking".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleSmallBluegray400_1.copyWith(height: 1.57),
                ),
              ),
              Padding(
                padding: getPadding(top: 38, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: getMargin(right: 7),
                        padding: getPadding(left: 18, top: 24, right: 18, bottom: 24),
                        decoration: AppDecoration.outlinePrimary.copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              height: getSize(64),
                              width: getSize(64),
                              padding: getPadding(all: 16),
                              decoration: IconButtonStyleHelper.fillPrimary,
                              child: CustomImageView(svgPath: ImageConstant.imgWork),
                            ),
                            Padding(
                              padding: getPadding(top: 29),
                              child: Text(
                                "lbl_find_a_job".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            Container(
                              width: getHorizontalSize(120),
                              margin: getMargin(top: 9),
                              child: Text(
                                "msg_it_s_easy_to_find".tr,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.labelLarge!.copyWith(height: 1.67),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: getMargin(left: 7),
                        padding: getPadding(left: 14, top: 24, right: 14, bottom: 24),
                        decoration: AppDecoration.outlineOnPrimary.copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              height: getSize(64),
                              width: getSize(64),
                              padding: getPadding(all: 16),
                              decoration: IconButtonStyleHelper.fillOrange,
                              child: CustomImageView(svgPath: ImageConstant.imgProfile),
                            ),
                            Padding(
                              padding: getPadding(top: 29),
                              child: Text(
                                "lbl_find_a_employee".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            Container(
                              width: getHorizontalSize(109),
                              margin: getMargin(top: 9),
                              child: Text(
                                "msg_it_s_easy_to_find2".tr,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.labelLarge!.copyWith(height: 1.67),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          text: "lbl_continue".tr,
          margin: getMargin(left: 24, right: 24, bottom: 55),
          buttonStyle: CustomButtonStyles.fillPrimary,
          onTap: () {
            onTapContinue();
          },
        ),
      ),
    );
  }

  /// Navigates to the specialization screen when the action is triggered.
  onTapContinue() {
    Get.toNamed(AppRoutes.speciallizationScreen);
  }

  /// Navigates to the previous screen.
  onTapImgImage() {
    Get.back();
  }
}
