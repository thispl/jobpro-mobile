import 'package:get/get.dart';import 'home_item_model.dart';/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {Rx<List<HomeItemModel>> homeItemList = Rx(List.generate(2,(index) => HomeItemModel()));

 }
