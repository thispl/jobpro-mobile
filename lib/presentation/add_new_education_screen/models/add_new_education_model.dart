import 'package:get/get.dart';import 'package:jobpro/data/models/selectionPopupModel/selection_popup_model.dart';/// This class defines the variables used in the [add_new_education_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddNewEducationModel {Rx<List<SelectionPopupModel>> dropdownItemList = Rx([SelectionPopupModel(id:1,title:"Item One",isSelected:true,),SelectionPopupModel(id:2,title:"Item Two",),SelectionPopupModel(id:3,title:"Item Three",)]);

 }
