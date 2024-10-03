import 'package:get/get.dart';
import 'package:jobpro/presentation/job_details/model/job_details_model.dart';
import 'package:jobpro/presentation/job_details/service/job_details_service.dart';

class JobController extends GetxController {
  JobDetailService jobDetailService = Get.put(JobDetailService());
  var reconList = <JobDetailsModel>[].obs;
  var isLoading = true.obs;
  var description= ''.obs;
  @override
  void onInit() {
    fetchJobDetails();
    super.onInit();
  }

  Future<void> fetchJobDetails() async {
  isLoading(true);
  try {
    var recons = await jobDetailService.fetchJobDetails();
    if (recons != null) {
      reconList.value = recons;
    }
  } finally {
    isLoading(false); 
  }
}
}
