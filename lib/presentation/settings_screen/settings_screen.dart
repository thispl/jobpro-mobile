import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/app_bar/appbar_image.dart';
import 'package:jobpro/widgets/app_bar/appbar_title.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';
import 'package:jobpro/presentation/logout_popup_dialog/logout_popup_dialog.dart';
import 'package:jobpro/presentation/logout_popup_dialog/controller/logout_popup_controller.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        appBar: CustomAppBar(
          height: getVerticalSize(51),
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage(
            svgPath: ImageConstant.imgGroup162799,
            margin: getMargin(left: 24, top: 13, bottom: 14),
            onTap: () {
              onTapArrowbackone();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "lbl_settings".tr),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(top: 28),
            child: Padding(
              padding: getPadding(left: 24, right: 24, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: getPadding(top: 13, bottom: 13),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: getPadding(top: 3, bottom: 2),
                          child: SizedBox(
                            height: getSize(64),
                            width: getSize(64),
                            child: CircularProgressIndicator(
                              value: 0.5,
                              strokeWidth: getHorizontalSize(4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "msg_profile_completeness".tr,
                                style: CustomTextStyles.titleMediumInterOnPrimaryContainer,
                              ),
                              Opacity(
                                opacity: 0.8,
                                child: Container(
                                  width: getHorizontalSize(199),
                                  margin: getMargin(top: 6),
                                  child: Text(
                                    "msg_quality_profiles".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodySmallOnPrimaryContainer.copyWith(height: 1.67),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(top: 32),
                      child: Text("lbl_account".tr, style: CustomTextStyles.labelLargeSemiBold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapAccount();
                    },
                    child: Padding(
                      padding: getPadding(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgPerson,
                            height: getSize(24),
                            width: getSize(24),
                            margin: getMargin(top: 3),
                          ),
                          Padding(
                            padding: getPadding(left: 12, top: 5),
                            child: Text(
                              "lbl_personal_info".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          Spacer(),
                          CustomImageView(
                            svgPath: ImageConstant.imgArrowrightPrimary,
                            height: getSize(24),
                            width: getSize(24),
                            margin: getMargin(bottom: 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 16),
                    child: Divider(indent: getHorizontalSize(36)),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapPrivacy();
                    },
                    child: Padding(
                      padding: getPadding(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgUserPrimary,
                            height: getSize(24),
                            width: getSize(24),
                            margin: getMargin(top: 3),
                          ),
                          Padding(
                            padding: getPadding(left: 12, top: 7),
                            child: Text(
                              "lbl_experience".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          Spacer(),
                          CustomImageView(
                            svgPath: ImageConstant.imgArrowrightPrimary,
                            height: getSize(24),
                            width: getSize(24),
                            margin: getMargin(bottom: 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 14),
                    child: Divider(indent: getHorizontalSize(36)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(top: 26),
                      child: Text("lbl_general".tr, style: CustomTextStyles.labelLargeSemiBold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapNotification();
                    },
                    child: Padding(
                      padding: getPadding(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgBell,
                            height: getSize(24),
                            width: getSize(24),
                            margin: getMargin(top: 2),
                          ),
                          Padding(
                            padding: getPadding(left: 12, top: 2),
                            child: Text(
                              "lbl_notification".tr,
                              style: CustomTextStyles.titleMediumPoppins,
                            ),
                          ),
                          Spacer(),
                          CustomImageView(
                            svgPath: ImageConstant.imgArrowrightPrimary,
                            height: getSize(24),
                            width: getSize(24),
                            margin: getMargin(bottom: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 16),
                    child: Divider(indent: getHorizontalSize(36)),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapLanguage();
                    },
                    child: Padding(
                      padding: getPadding(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgGlobe,
                            height: getSize(24),
                            width: getSize(24),
                            margin: getMargin(top: 2),
                          ),
                          Padding(
                            padding: getPadding(left: 12, top: 7),
                            child: Text(
                              "lbl_language".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          Spacer(),
                          CustomImageView(
                            svgPath: ImageConstant.imgArrowrightPrimary,
                            height: getSize(24),
                            width: getSize(24),
                            margin: getMargin(bottom: 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 14),
                    child: Divider(indent: getHorizontalSize(36)),
                  ),
                  Padding(
                    padding: getPadding(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgShielddone,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                        Padding(
                          padding: getPadding(left: 12, top: 4),
                          child: Text(
                            "lbl_security".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowrightPrimary,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 14),
                    child: Divider(indent: getHorizontalSize(36)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(top: 26),
                      child: Text("lbl_about".tr, style: CustomTextStyles.labelLargeSemiBold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapLegalandpolicie();
                    },
                    child: Padding(
                      padding: getPadding(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgShield,
                            height: getSize(24),
                            width: getSize(24),
                          ),
                          Padding(
                            padding: getPadding(left: 12, top: 4),
                            child: Text(
                              "msg_legal_and_policies".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          Spacer(),
                          CustomImageView(
                            svgPath: ImageConstant.imgArrowrightPrimary,
                            height: getSize(24),
                            width: getSize(24),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 15),
                    child: Divider(indent: getHorizontalSize(36)),
                  ),
                  Padding(
                    padding: getPadding(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgQuestionPrimary,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                        Padding(
                          padding: getPadding(left: 12, top: 4),
                          child: Text(
                            "lbl_help_feedback".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowrightPrimary,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 17),
                    child: Divider(indent: getHorizontalSize(36)),
                  ),
                  Padding(
                    padding: getPadding(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgAlert,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                        Padding(
                          padding: getPadding(left: 12, top: 2),
                          child: Text(
                            "lbl_about_us".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowrightPrimary,
                          height: getSize(24),
                          width: getSize(24),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        onTapTxtLargelabelmediu();
                      },
                      child: Padding(
                        padding: getPadding(top: 28),
                        child: Text(
                          "lbl_logout".tr,
                          style: CustomTextStyles.titleMediumRedA200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar: CustomBottomBar(onChanged: (BottomBarEnum type) {
        //   Get.toNamed(getCurrentRoute(type), id: 1);
        // }),
      ),
    );
  }

  /// Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return AppRoutes.homePage;
  //     case BottomBarEnum.Message:
  //       return AppRoutes.messagePage;
  //     case BottomBarEnum.Saved:
  //       return AppRoutes.savedPage;
  //     case BottomBarEnum.Profile:
  //       return AppRoutes.profilePage;
  //     default:
  //       return "/";
  //   }
  // }

  // /// Handling page based on route
  // Widget getCurrentPage(String currentRoute) {
  //   switch (currentRoute) {
  //     case AppRoutes.homePage:
  //       return HomePage();
  //     case AppRoutes.messagePage:
  //       return MessagePage();
  //     case AppRoutes.savedPage:
  //       return SavedPage();
  //     case AppRoutes.profilePage:
  //       return ProfilePage();
  //     default:
  //       return DefaultWidget();
  //   }
  // }

  /// Navigates to the previous screen
  onTapArrowbackone() {
    Get.back();
  }

  /// Navigates to the personalInfoScreen
  onTapAccount() {
    Get.toNamed(AppRoutes.personalInfoScreen);
  }

  /// Navigates to the experienceSettingScreen
  onTapPrivacy() {
    Get.toNamed(AppRoutes.experienceSettingScreen);
  }

  /// Navigates to the notificationsScreen
  onTapNotification() {
    Get.toNamed(AppRoutes.notificationsScreen);
  }

  /// Navigates to the languageScreen
  onTapLanguage() {
    Get.toNamed(AppRoutes.languageScreen);
  }

  /// Navigates to the privacyScreen
  onTapLegalandpolicie() {
    Get.toNamed(AppRoutes.privacyScreen);
  }

  /// Displays a dialog with the [LogoutPopupDialog] content
  onTapTxtLargelabelmediu() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.only(left: 0),
        content: LogoutPopupDialog(Get.put(LogoutPopupController())),
      ),
    );
  }
}
