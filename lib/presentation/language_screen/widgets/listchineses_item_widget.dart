import '../controller/language_controller.dart';
import '../models/listchineses_item_model.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';

// ignore: must_be_immutable
class ListchinesesItemWidget extends StatelessWidget {
  ListchinesesItemWidget(
    this.listchinesesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListchinesesItemModel listchinesesItemModelObj;

  var controller = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        listchinesesItemModelObj.chinesesTxt.value,
        style: theme.textTheme.titleMedium,
      ),
    );
  }
}
