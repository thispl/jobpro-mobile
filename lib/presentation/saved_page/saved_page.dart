import 'package:flutter/material.dart';
import 'package:jobpro/presentation/job_details/controller/job_details_controller.dart';
import 'package:jobpro/presentation/saved_page/controller/saved_page_controller.dart';
import 'package:jobpro/widgets/custom_icon_button.dart';

import '../saved_page/widgets/saved_item_widget.dart';
import 'package:get/get.dart'; // Don't forget to import Get
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/app_bar/appbar_image.dart';
import 'package:jobpro/widgets/app_bar/appbar_title.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class SavedPage extends StatelessWidget {
  // final JobController recon = Get.put(JobController());
  final SavedPageController _savedPageController = Get.put(SavedPageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage(
            svgPath: ImageConstant.imgGroup162799,
            margin: getMargin(left: 24, top: 13, bottom: 13),
            onTap: () {
              Get.back(); // Update this if necessary
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "lbl_saved".tr),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(left: 24, top: 22),
              child: Text(
                "lbl_recent_jobs".tr,
                style: CustomTextStyles.titleMediumInter,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(left: 24, top: 16, right: 24),
                  child: Obx(() {
                    if (_savedPageController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (_savedPageController.reconList.isEmpty) {
                      return const Center(child: Text('No Saved Jobs.'));
                    } else {
                      return RefreshIndicator(
                        onRefresh: () async {
                          await _savedPageController.fetchSavedDetails();
                          // await recon.fetchJobDetails();
                        },
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: getVerticalSize(16));
                          },
                          itemCount: _savedPageController.reconList.length,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: Alignment.center,
                              
                                child: Container(
                                  padding: getPadding(all: 16),
                                  decoration: AppDecoration.outlineIndigo.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder16,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomIconButton(
                                            height: getSize(48),
                                            width: getSize(48),
                                            padding: getPadding(all: 8),
                                            child: CustomImageView(svgPath: ImageConstant.imgGroupPrimary),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                
                                                  Text(
                                                    _savedPageController.reconList[index].subject,
                                                    style: CustomTextStyles.titleMediumBold_1,
                                                    softWrap: true,
                                                    maxLines: 3,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                
                                                Padding(
                                                  padding: getPadding(top: 5),
                                                  child: Text(
                                                    _savedPageController.reconList[index].customer,
                                                    softWrap: true,
                                                    style: CustomTextStyles.labelLargeBluegray300SemiBold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                      Padding(
                                        padding: getPadding(left: 60, top: 9),
                                        child: Text(
                                          '${_savedPageController.reconList[index].currency} - ${_savedPageController.reconList[index].amount}',
                                          style: CustomTextStyles.labelLargeGray600_1,
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              
                            );
                          },
                        ),
                      );
                    }
                  }),
                ),
              ),
            ),
          ],
        ),

        // body: Container(
        //   width: double.maxFinite,
        //   padding: getPadding(left: 24, right: 24),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Expanded(
        //         child: Padding(
        //           padding: getPadding(top: 30),
        //           child: Obx(
        //             () {
        //               // Check if the saved item list is empty
        //               if (controller.savedModelObj.value.savedItemList.isEmpty) {
        //                 return Center(child: Text("No saved jobs available."));
        //               }
        //               return ListView.separated(
        //                 physics: const BouncingScrollPhysics(),
        //                 shrinkWrap: true,
        //                 separatorBuilder: (context, index) {
        //                   return SizedBox(height: getVerticalSize(12));
        //                 },
        //                 itemCount: controller.savedModelObj.value.savedItemList.length,
        //                 itemBuilder: (context, index) {
        //                   SavedItemModel model = controller.savedModelObj.value.savedItemList[index];
        //                   return SavedItemWidget(model);
        //                 },
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //       // Container(
        //       //   height: getVerticalSize(148),
        //       //   width: getHorizontalSize(327),
        //       //   decoration: BoxDecoration(
        //       //     color: appTheme.gray5001,
        //       //     borderRadius: BorderRadius.circular(getHorizontalSize(16)),
        //       //     border: Border.all(color: appTheme.indigo50, width: getHorizontalSize(1)),
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to 
  /// navigate to the previous screen in the navigation stack.
  void onTapArrowbackone() {
    Get.back();
  }
}
