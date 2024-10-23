import 'package:get/get.dart';
import 'package:jobpro/presentation/saved_page/models/saved_page_model.dart';
import 'package:jobpro/presentation/saved_page/services/saved_page_service.dart';

class SavedPageController extends GetxController {
  SavedPageService savedPageService = Get.put(SavedPageService());
  var reconList = <SavedPageModel>[].obs;
  // var savedJobs = <JobDetailsModel>[].obs;
  var isLoading = true.obs;
  var description= ''.obs;
  var isBookmarked = false.obs;
  var message = ''.obs;
  
  @override
  void onInit() {
    fetchSavedDetails();
    super.onInit();
  }

  Future<void> fetchSavedDetails() async {
  isLoading(true);
  try {
    var recons = await savedPageService.fetchSavedDetails();
    if (recons != null) {
      reconList.value = recons;
    }
  } finally {
    isLoading(false); 
  }
}
}
