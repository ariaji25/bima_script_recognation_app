import 'package:bima_apps/views/aksara/aksara_view_model.dart';
import 'package:get/get.dart';

class AksaraBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AksaraViewModel());
  }
}
