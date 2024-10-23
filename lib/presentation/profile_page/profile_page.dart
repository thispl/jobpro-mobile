import '../profile_page/widgets/chipviewskills_item_widget.dart';
import '../profile_page/widgets/profile_item_widget.dart';
import 'controller/profile_controller.dart';
import 'models/chipviewskills_item_model.dart';
import 'models/profile_item_model.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/app_bar/appbar_image.dart';
import 'package:jobpro/widgets/app_bar/appbar_image_1.dart';
import 'package:jobpro/widgets/app_bar/appbar_title.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';
import 'package:jobpro/widgets/custom_checkbox_button.dart';
import 'package:jobpro/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage(
            svgPath: ImageConstant.imgGroup162799,
            margin: getMargin(left: 24, top: 13, bottom: 13),
            onTap: () {
              onTapArrowbackone();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "lbl_profile".tr),
          actions: [
            AppbarImage1(
              svgPath: ImageConstant.imgGroup162903,
              margin: getMargin(left: 24, top: 13, right: 24, bottom: 13),
              onTap: () {
                onTapImage();
              },
            ),
          ],
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: getPadding(top: 30),
            child: Padding(
              padding: getPadding(bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Profile Banner
                  SizedBox(
                    height: getVerticalSize(225),
                    width: getHorizontalSize(327),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgBg,
                          height: getVerticalSize(120),
                          width: getHorizontalSize(327),
                          radius: BorderRadius.circular(getHorizontalSize(8)),
                          alignment: Alignment.topCenter,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: getPadding(left: 87, right: 87),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.img63,
                                  height: getSize(89),
                                  width: getSize(89),
                                  radius: BorderRadius.circular(getHorizontalSize(44)),
                                ),
                                Padding(
                                  padding: getPadding(top: 9),
                                  child: Text(
                                    "msg_gustavo_lipshutz".tr,
                                    style: CustomTextStyles.titleMediumErrorContainer,
                                  ),
                                ),
                                Obx(() => CustomCheckboxButton(
                                      text: "lbl_open_to_work".tr,
                                      value: controller.opentowork.value,
                                      margin: getMargin(top: 5),
                                      textStyle: CustomTextStyles.titleSmallPoppinsBluegray300,
                                      onChange: (value) {
                                        controller.opentowork.value = value;
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Job Title
                  Container(
                    width: getHorizontalSize(272),
                    margin: getMargin(left: 52, top: 15, right: 50),
                    child: Text(
                      "msg_ui_ux_designer".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
                    ),
                  ),
                  // Applied and Reviewed Stats
                  Padding(
                    padding: getPadding(left: 24, top: 17, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildStatisticContainer("lbl_25".tr, "lbl_applied".tr),
                        buildStatisticContainer("lbl_10".tr, "lbl_reviewed".tr, marginLeft: 19),
                      ],
                    ),
                  ),
                  // Divider
                  Padding(
                    padding: getPadding(top: 24),
                    child: Divider(color: appTheme.indigo50),
                  ),
                  // About Me Section
                  buildProfileSection("lbl_about_me".tr, "msg_lorem_ipsum_dolor8".tr, 5),
                  // Skills Section
                  buildSkillsSection(),
                  // Experience Section
                  buildExperienceSection(),
                  // Education Section
                  buildEducationSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper to create stat blocks for 'Applied' and 'Reviewed'
  Widget buildStatisticContainer(String valueText, String labelText, {double marginLeft = 0}) {
    return Container(
      width: getHorizontalSize(154),
      margin: getMargin(left: marginLeft),
      padding: getPadding(left: 40, top: 12, right: 40, bottom: 12),
      decoration: AppDecoration.fillGray200.copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(valueText, style: CustomTextStyles.titleMediumBold_1),
          SizedBox(width: 8),
          Text(labelText, style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }

  // Builds the profile section (About Me, Skills, etc.)
  Widget buildProfileSection(String title, String content, int maxLines) {
    return Container(
      margin: getMargin(left: 24, top: 22, right: 24),
      padding: getPadding(left: 16, top: 14, right: 16, bottom: 14),
      decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: CustomTextStyles.titleMediumInter),
              CustomImageView(svgPath: ImageConstant.imgEditsquare, height: getSize(24), width: getSize(24)),
            ],
          ),
          SizedBox(height: 14),
          Text(content, maxLines: maxLines, overflow: TextOverflow.ellipsis, style: CustomTextStyles.titleSmallBluegray400_1.copyWith(height: 1.57)),
        ],
      ),
    );
  }

  // Builds the skills section
  Widget buildSkillsSection() {
    return Container(
      margin: getMargin(left: 24, top: 24, right: 24),
      padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
      decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(left: 7, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: getPadding(top: 1, bottom: 2),
                  child: Text("lbl_skills".tr, style: CustomTextStyles.titleMediumInter),
                ),
                CustomImageView(svgPath: ImageConstant.imgEditsquare, height: getSize(24), width: getSize(24)),
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: 12, bottom: 17),
            child: Obx(() => Wrap(
              runSpacing: getVerticalSize(12),
              spacing: getHorizontalSize(12),
              children: List<Widget>.generate(
                controller.profileModelObj.value.chipviewskillsItemList.value.length,
                (index) {
                  ChipviewskillsItemModel model = controller.profileModelObj.value.chipviewskillsItemList.value[index];
                  return ChipviewskillsItemWidget(model);
                },
              ),
            )),
          ),
        ],
      ),
    );
  }

  // Builds the experience section
  Widget buildExperienceSection() {
    return Container(
      margin: getMargin(left: 24, top: 24, right: 24),
      padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
      decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: getPadding(top: 2), child: Text("lbl_experience".tr, style: CustomTextStyles.titleMediumInter)),
              CustomImageView(svgPath: ImageConstant.imgEditsquare, height: getSize(24), width: getSize(24)),
            ],
          ),
          SizedBox(height: getVerticalSize(12)),
          // Add experience items here
          // For example:
          // ProfileItemWidget(...),
        ],
      ),
    );
  }

  // Builds the education section
  Widget buildEducationSection() {
    return Container(
      margin: getMargin(left: 24, top: 24, right: 24),
      padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
      decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: getPadding(top: 2), child: Text("lbl_education".tr, style: CustomTextStyles.titleMediumInter)),
              CustomImageView(svgPath: ImageConstant.imgEditsquare, height: getSize(24), width: getSize(24)),
            ],
          ),
          SizedBox(height: getVerticalSize(12)),
          // Add education items here
          // For example:
          // ProfileItemWidget(...),
        ],
      ),
    );
  }

  void onTapArrowbackone() {
    Get.back();
  }

  void onTapImage() {
    Get.toNamed(AppRoutes.settingsScreen);
  }
}
