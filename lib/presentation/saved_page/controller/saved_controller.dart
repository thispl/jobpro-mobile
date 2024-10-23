import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/presentation/saved_page/models/saved_item_model.dart';import 'package:jobpro/presentation/saved_page/models/saved_model.dart';/// A controller class for the SavedPage.
///
/// This class manages the state of the SavedPage, including the
/// current savedModelObj
class SavedController extends GetxController {
  var savedModelObj = SavedModel().obs;

  SavedController(Rx<SavedModel> obs);

  void addItem(SavedItemModel item) {
    savedModelObj.value.savedItemList.add(item);
  }

  void removeItem(SavedItemModel item) {
    savedModelObj.value.savedItemList.remove(item);
  }
}
