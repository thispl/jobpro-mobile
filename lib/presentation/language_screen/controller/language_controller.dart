import 'package:jobpro/core/app_export.dart';import 'package:jobpro/presentation/language_screen/models/language_model.dart';/// A controller class for the LanguageScreen.
///
/// This class manages the state of the LanguageScreen, including the
/// current languageModelObj
class LanguageController extends GetxController {Rx<LanguageModel> languageModelObj = LanguageModel().obs;

 }
