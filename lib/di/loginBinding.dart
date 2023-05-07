import 'package:bima_apps/views/home_new/homeNewViewModel.dart';
import 'package:bima_apps/views/login/loginViewModel.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginViewModel());
  }
}
