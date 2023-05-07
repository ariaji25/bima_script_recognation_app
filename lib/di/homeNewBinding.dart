import 'package:bima_apps/views/home_new/homeNewViewModel.dart';
import 'package:get/get.dart';

class HomeNewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeNewViewModel());
  }
}
