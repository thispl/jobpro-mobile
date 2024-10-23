import 'package:get/get.dart';

class SavedItemModel {
  RxString uxdesignerTxt = ''.obs;
  RxString dummystudioTxt = ''.obs;
  RxString dummystudio2Txt = ''.obs;
  RxString dummystudio3Txt = ''.obs;
  RxString? id;
}

class SavedModel {
  RxList<SavedItemModel> savedItemList = <SavedItemModel>[].obs;
}

class SavedController extends GetxController {
  var savedModelObj = SavedModel().obs;

  void addItem(SavedItemModel item) {
    savedModelObj.value.savedItemList.add(item);
  }

  void removeItem(SavedItemModel item) {
    savedModelObj.value.savedItemList.remove(item);
  }
}