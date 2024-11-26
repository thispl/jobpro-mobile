import '../notifications_screen/widgets/notifications_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notifications_item_model.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/app_bar/appbar_image.dart';
import 'package:jobpro/widgets/app_bar/appbar_title.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';

class NotificationsScreen extends GetWidget<NotificationsController> {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
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
          title: AppbarTitle(
            text: "lbl_notifications".tr,
          ),
        ),
        body: Container(
          width: getHorizontalSize(327),
          margin: getMargin(left: 24, top: 30, right: 24, bottom: 5),
          padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
          decoration: AppDecoration.outlineIndigo.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "msg_messages_notifications".tr,
                style: CustomTextStyles.labelLargePoppinsGray500,
              ),
              Expanded(
                child: Padding(
                  padding: getPadding(top: 17),
                  child: Obx(
                    () => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: getPadding(top: 10.5, bottom: 10.5),
                          child: SizedBox(
                            width: getHorizontalSize(295),
                            child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: appTheme.indigo50,
                            ),
                          ),
                        );
                      },
                      itemCount: controller.notificationsModelObj.value.notificationsItemList.value.length,
                      itemBuilder: (context, index) {
                        NotificationsItemModel model =
                            controller.notificationsModelObj.value.notificationsItemList.value[index];
                        return NotificationsItemWidget(model);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to 
  /// navigate to the previous screen in the navigation stack.
  onTapArrowbackone() {
    Get.back();
  }
}
