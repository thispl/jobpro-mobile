import 'controller/notifications_my_proposals_tab_container_controller.dart';import 'package:flutter/material.dart';import 'package:jobpro/core/app_export.dart';import 'package:jobpro/presentation/notifications_general_page/notifications_general_page.dart';import 'package:jobpro/presentation/notifications_my_proposals_page/notifications_my_proposals_page.dart';import 'package:jobpro/widgets/app_bar/appbar_image.dart';import 'package:jobpro/widgets/app_bar/appbar_image_1.dart';import 'package:jobpro/widgets/app_bar/appbar_title.dart';import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';class NotificationsMyProposalsTabContainerScreen extends GetWidget<NotificationsMyProposalsTabContainerController> {const NotificationsMyProposalsTabContainerScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(backgroundColor: appTheme.whiteA70001, appBar: CustomAppBar(leadingWidth: getHorizontalSize(48), leading: AppbarImage(svgPath: ImageConstant.imgGroup162799, margin: getMargin(left: 24, top: 13, bottom: 13)), centerTitle: true, title: AppbarTitle(text: "lbl_notifications".tr), actions: [AppbarImage1(svgPath: ImageConstant.imgGroup162903, margin: getMargin(left: 24, top: 13, right: 24, bottom: 13), onTap: () {onTapImage();})]), body: SizedBox(width: double.maxFinite, child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Container(height: getVerticalSize(44), width: getHorizontalSize(202), margin: getMargin(left: 24, top: 30), child: TabBar(controller: controller.tabviewController, isScrollable: true, labelColor: appTheme.gray5001, labelStyle: TextStyle(fontSize: getFontSize(12), fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w600), unselectedLabelColor: appTheme.gray600, unselectedLabelStyle: TextStyle(fontSize: getFontSize(12), fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w600), indicator: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(getHorizontalSize(12))), tabs: [Tab(child: Text("lbl_general".tr)), Tab(child: Text("lbl_my_proposals".tr))])), SizedBox(height: getVerticalSize(644), child: TabBarView(controller: controller.tabviewController, children: [NotificationsGeneralPage(), NotificationsMyProposalsPage()]))])))); } 
/// Navigates to the settingsScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the settingsScreen.
onTapImage() { Get.toNamed(AppRoutes.settingsScreen, ); } 
 }