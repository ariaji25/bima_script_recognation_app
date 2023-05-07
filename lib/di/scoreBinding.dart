import 'package:bima_apps/views/score/score_view_model.dart';
import 'package:get/get.dart';

class ScoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ScoreViewModel());
  }
}
