import '../controller/language_controller.dart';
import '../models/listenglishuk_item_model.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/custom_checkbox_button.dart';

// ignore: must_be_immutable
class ListenglishukItemWidget extends StatelessWidget {
  ListenglishukItemWidget(
    this.listenglishukItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListenglishukItemModel listenglishukItemModelObj;

  var controller = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomCheckboxButton(
        width: getHorizontalSize(295),
        text: "lbl_english_uk".tr,
        value: listenglishukItemModelObj.englishuk.value,
        textStyle: CustomTextStyles.titleMediumGray900,
        isRightCheck: true,
        onChange: (value) {
          listenglishukItemModelObj.englishuk.value = value;
        },
      ),
    );
  }
}
