import '../filter_bottomsheet/widgets/chipviewjobs_item_widget.dart';import 'controller/filter_controller.dart';import 'models/chipviewjobs_item_model.dart';import 'package:flutter/material.dart';import 'package:jobpro/core/app_export.dart';import 'package:jobpro/widgets/custom_elevated_button.dart';import 'package:jobpro/widgets/custom_outlined_button.dart';
// ignore_for_file: must_be_immutable
class FilterBottomsheet extends StatelessWidget {FilterBottomsheet(this.controller, {Key? key}) : super(key: key);

FilterController controller;

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return Container(width: double.maxFinite, padding: getPadding(left: 24, top: 25, right: 24, bottom: 25), decoration: AppDecoration.fillWhiteA70001.copyWith(borderRadius: BorderRadiusStyle.customBorderTL24), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Row(children: [CustomImageView(svgPath: ImageConstant.imgClose, height: getSize(24), width: getSize(24), onTap: () {onTapImgCloseone();}), Padding(padding: getPadding(left: 16), child: Text("lbl_filter".tr, style: CustomTextStyles.titleMedium18)), Spacer(), Padding(padding: getPadding(top: 3, bottom: 2), child: Text("lbl_reset_filters".tr, style: CustomTextStyles.titleSmallDeeporangeA200))]), Padding(padding: getPadding(top: 29), child: Text("lbl_categories".tr, style: CustomTextStyles.titleMediumBold_1)), Padding(padding: getPadding(top: 14, right: 51), child: Row(children: [CustomElevatedButton(height: getVerticalSize(44), width: getHorizontalSize(159), text: "msg_design_creative".tr, leftIcon: Container(margin: getMargin(right: 5), child: CustomImageView(svgPath: ImageConstant.imgCheckmarkGray5001)), buttonStyle: CustomButtonStyles.fillDeepOrangeA, buttonTextStyle: CustomTextStyles.labelLargeGray5001SemiBold_1), CustomOutlinedButton(width: getHorizontalSize(100), text: "lbl_finance".tr, margin: getMargin(left: 16), leftIcon: Container(margin: getMargin(right: 4), child: CustomImageView(svgPath: ImageConstant.imgPlus)))])), Padding(padding: getPadding(top: 10, right: 3), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [CustomOutlinedButton(width: getHorizontalSize(211), text: "msg_engineering_architecture".tr, leftIcon: Container(margin: getMargin(right: 4), child: CustomImageView(svgPath: ImageConstant.imgPlus))), CustomOutlinedButton(width: getHorizontalSize(96), text: "lbl_writing".tr, leftIcon: Container(margin: getMargin(right: 4), child: CustomImageView(svgPath: ImageConstant.imgPlus)))])), Padding(padding: getPadding(top: 10, right: 38), child: Row(children: [CustomOutlinedButton(width: getHorizontalSize(114), text: "lbl_marketing".tr, leftIcon: Container(margin: getMargin(right: 5), child: CustomImageView(svgPath: ImageConstant.imgPlus))), CustomOutlinedButton(width: getHorizontalSize(158), text: "msg_development_it".tr, margin: getMargin(left: 16), leftIcon: Container(margin: getMargin(right: 5), child: CustomImageView(svgPath: ImageConstant.imgPlus)))])), Padding(padding: getPadding(top: 26), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("lbl_salaries".tr, style: CustomTextStyles.titleMediumBold_1), Padding(padding: getPadding(top: 2, bottom: 2), child: Text("lbl_6_000_month".tr, style: CustomTextStyles.labelLargeDeeporangeA200))])), Padding(padding: getPadding(top: 16), child: SliderTheme(data: SliderThemeData(trackShape: RoundedRectSliderTrackShape(), activeTrackColor: appTheme.deepOrangeA200, inactiveTrackColor: appTheme.blueGray5001, thumbColor: theme.colorScheme.onPrimaryContainer.withOpacity(1), thumbShape: RoundSliderThumbShape()), child: Slider(value: 52.91, min: 0.0, max: 100.0, onChanged: (value) {}))), Padding(padding: getPadding(top: 2), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("lbl_560".tr, style: CustomTextStyles.labelLargeSemiBold), Text("lbl_12_000".tr, style: CustomTextStyles.labelLargeSemiBold)])), Padding(padding: getPadding(top: 28), child: Text("lbl_jobs".tr, style: CustomTextStyles.titleMediumBold_1)), Padding(padding: getPadding(top: 16), child: Obx(() => Wrap(runSpacing: getVerticalSize(16), spacing: getHorizontalSize(16), children: List<Widget>.generate(controller.filterModelObj.value.chipviewjobsItemList.value.length, (index) {ChipviewjobsItemModel model = controller.filterModelObj.value.chipviewjobsItemList.value[index]; return ChipviewjobsItemWidget(model);})))), CustomElevatedButton(text: "lbl_apply_filters".tr, margin: getMargin(top: 30, bottom: 15), buttonStyle: CustomButtonStyles.fillPrimary)])); } 


/// Navigates to the previous screen.
///
/// When the action is triggered, this function uses the [Get] package to 
/// navigate to the previous screen in the navigation stack.
onTapImgCloseone() { Get.back(); } 
 }