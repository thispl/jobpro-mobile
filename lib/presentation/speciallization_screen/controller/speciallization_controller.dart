import 'package:jobpro/core/app_export.dart';import 'package:jobpro/presentation/speciallization_screen/models/speciallization_model.dart';/// A controller class for the SpeciallizationScreen.
///
/// This class manages the state of the SpeciallizationScreen, including the
/// current speciallizationModelObj
class SpeciallizationController extends GetxController {Rx<SpeciallizationModel> speciallizationModelObj = SpeciallizationModel().obs;

Rx<bool> designcreative = false.obs;

Rx<String> radioGroup = "".obs;

Rx<String> radioGroup1 = "".obs;

Rx<String> radioGroup2 = "".obs;

 }
