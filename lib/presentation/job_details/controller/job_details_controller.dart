import 'package:get/get.dart';
import 'package:jobpro/presentation/job_details/model/job_details_model.dart';
import 'package:jobpro/presentation/job_details/service/job_details_service.dart';

class JobController extends GetxController {
  JobDetailService jobDetailService = Get.put(JobDetailService());
  var reconList = <JobDetailsModel>[].obs;
  // var savedJobs = <JobDetailsModel>[].obs;
  var isLoading = true.obs;
  var description= ''.obs;
  var isBookmarked = false.obs;
  var message = ''.obs;
  void update_saved_jobs(String name,String userEmail,String subject) async {
    // Call your service here
    var responseMessage = await JobDetailService().update_saved_jobs(name,userEmail,subject);
    message.value = responseMessage;
    isBookmarked.value = true;
    // isSubmitted.value = true;  
  }
  @override
  void onInit() {
    fetchJobDetails();
    super.onInit();
  }

  Future<void> fetchJobDetails() async {
  isLoading(true);
  try {
    var recons = await jobDetailService.fetchJobDetails(limit:200);
    if (recons != null) {
      reconList.value = recons;
    }
  } finally {
    isLoading(false); 
  }
}
}
