import 'package:bima_apps/views/quis/quis_view_Model.dart';
import 'package:bima_apps/views/rangking/rangking_view_Model.dart';
import 'package:get/get.dart';

class QuisBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(QuisViewModel());
  }
}
