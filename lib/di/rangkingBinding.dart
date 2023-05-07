import 'package:bima_apps/views/home/homeViewModel.dart';
import 'package:bima_apps/views/rangking/rangking_view_Model.dart';
import 'package:get/get.dart';

class RangkingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RangkingViewModel());
  }
}
