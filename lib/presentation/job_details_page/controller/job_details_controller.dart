import 'package:jobpro/core/app_export.dart';import 'package:jobpro/presentation/job_details_page/models/job_details_model.dart';/// A controller class for the JobDetailsPage.
///
/// This class manages the state of the JobDetailsPage, including the
/// current jobDetailsModelObj
class JobDetailsController extends GetxController {JobDetailsController(this.jobDetailsModelObj);

Rx<JobDetailsModel> jobDetailsModelObj;

 }
