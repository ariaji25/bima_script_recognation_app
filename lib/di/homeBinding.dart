import 'package:bima_apps/views/home/homeViewModel.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewModel());
  }
}
