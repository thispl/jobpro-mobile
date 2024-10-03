import 'package:flutter/foundation.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:jobpro/presentation/job_details/controller/job_details_controller.dart'; 
import 'package:jobpro/presentation/job_details/controller/job_details_controller.dart';
import 'package:jobpro/widgets/app_bar/appbar_subtitle_1.dart';

import '../home_page/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/app_bar/appbar_circleimage.dart';
import 'package:jobpro/widgets/app_bar/appbar_image_1.dart';
import 'package:jobpro/widgets/app_bar/appbar_subtitle.dart';
import 'package:jobpro/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';
import 'package:jobpro/widgets/custom_icon_button.dart';
import 'package:jobpro/widgets/custom_search_view.dart';
import 'package:jobpro/presentation/job_details/controller/job_details_controller.dart';
import 'package:jobpro/utils/authentication_manager.dart';
import 'package:jobpro/presentation/login_screen/login_screen.dart';
import 'package:intl/intl.dart'; 
class JobDetailsPage extends StatelessWidget {
  final JobController recon = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA70001,
        appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(74),
          leading: AppbarCircleimage(
            imagePath: ImageConstant.imgImage50x50,
            margin: getMargin(
              left: 24,
            ),
          ),
          title: Padding(
            padding: getPadding(
              left: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppbarSubtitle(
                  text: "msg_hi_welcome_back".tr,
                ),
                AppbarSubtitle2(
                  text: "msg_find_your_dream2".tr,
                  margin: getMargin(
                    top: 9,
                    right: 33,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Body Section
            Padding(
              padding: getPadding(left: 24, top: 22),
              child: Text(
                "lbl_recent_jobs".tr,
                style: CustomTextStyles.titleMediumInter,
              ),
            ),
            // Second Body Section
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 24,
                    top: 16,
                    right: 24,
                  ),
                  child: Obx(() {
                    if (recon.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (recon.reconList.isEmpty) {
                      return const Center(child: Text('No job details available.'));
                    } else {
                      return RefreshIndicator(
                        onRefresh: () async {
                          await recon.fetchJobDetails();
                        },
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (
                            context,
                            index,
                          ) {
                            return SizedBox(
                              height: getVerticalSize(16),
                            );
                          },
                          itemCount: recon.reconList.length,
                          itemBuilder: (context, index) {
                            // Parse creation date
                            DateTime creationDate = DateFormat("yyyy-MM-dd").parse('${recon.reconList[index].creation}');
                            DateTime nowDate = DateTime.now();

                            // Calculate the difference in days
                            int differenceInDays = nowDate.difference(creationDate).inDays;

                            return Align(
                              alignment: Alignment.center,
                              child: GestureDetector( 
                                onTap: () {
      // Navigate to the specific page when the box is tapped
                                Get.toNamed(AppRoutes.jobDetailsTabContainerScreen, arguments: {
                                  'subject': recon.reconList[index].subject,
                                  'customer': recon.reconList[index].customer,
                                  'currency': recon.reconList[index].currency,
                                  'amount': recon.reconList[index].amount,
                                  'creation': '$differenceInDays days ago',
                                  'jobType': recon.reconList[index].subject,
                                  'position': recon.reconList[index].subject,
                                  'description': recon.reconList[index].description,
                                  // Add other job details here if necessary
                                });
                              },
                              child: Container(
                                padding: getPadding(
                                  all: 16,
                                ),
                                decoration: AppDecoration.outlineIndigo.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder16,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomIconButton(
                                          height: getSize(48),
                                          width: getSize(48),
                                          padding: getPadding(
                                            all: 8,
                                          ),
                                          child: CustomImageView(
                                            svgPath: ImageConstant.imgGroupPrimary,
                                          ),
                                        ),
                                        SizedBox(width: 12), // Add space between icon and text
                                        Expanded( // Wrap in Expanded to allow wrapping
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  // Navigate to the specific page when the subject is tapped
                                                  Get.toNamed(AppRoutes.jobDetailsTabContainerScreen, arguments: {
                                                    'subject': recon.reconList[index].subject,
                                                    'customer': recon.reconList[index].customer,
                                                    'currency': recon.reconList[index].currency,
                                                    'amount': recon.reconList[index].amount,
                                                    'creation': '$differenceInDays days ago',
                                                    'jobType': recon.reconList[index].subject,
                                                    'position': recon.reconList[index].subject,
                                                    'description':recon.reconList[index].description,
                                                    'custom_recruiter_contact':recon.reconList[index].custom_recruiter_contact
                                                    // Add other job details here if necessary
                                                  },
                                                  );
                                                },
                                                child: Text(
                                                  recon.reconList[index].subject,
                                                  style: CustomTextStyles.titleMediumBold_1,
                                                  softWrap: true,
                                                  maxLines: 2, // Optional: limit lines
                                                  overflow: TextOverflow.ellipsis, // Optional: ellipsis for overflow
                                                ),
                                              ),
                                              // Text subject with wrapping enabled
                                              // Text(
                                              //   recon.reconList[index].subject,
                                              //   style: CustomTextStyles.titleMediumBold_1,
                                              //   softWrap: true,
                                              //   maxLines: 2, // Optional: limit lines
                                              //   overflow: TextOverflow.ellipsis, // Optional: ellipsis for overflow
                                              // ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 5,
                                                ),
                                                child: Text(
                                                  recon.reconList[index].customer,
                                                  softWrap: true,
                                                  style: CustomTextStyles.labelLargeBluegray300SemiBold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgBookmark,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(
                                            bottom: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 60,
                                        top: 9,
                                      ),
                                      child: Text(
                                        '${recon.reconList[index].currency} - ${recon.reconList[index].amount}',
                                        style: CustomTextStyles.labelLargeGray600_1,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: getPadding(
                                          top: 13,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CustomElevatedButton(
                                              height: getVerticalSize(28),
                                              width: getHorizontalSize(70),
                                              text: "lbl_fulltime".tr,
                                              buttonTextStyle: theme.textTheme.labelLarge!,
                                            ),
                                            CustomElevatedButton(
                                              height: getVerticalSize(28),
                                              width: getHorizontalSize(103),
                                              text: '$differenceInDays days ago',
                                              margin: getMargin(
                                                left: 8,
                                              ),
                                              buttonTextStyle: theme.textTheme.labelLarge!,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
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
      ),
    );
  }
}
