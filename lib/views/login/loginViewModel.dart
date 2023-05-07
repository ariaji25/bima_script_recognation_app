import 'dart:async';

import 'package:bima_apps/data/model/models.dart';
import 'package:bima_apps/data/remote/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';

class LoginViewModel extends GetxController {
  RxBool obsecureText = RxBool(true);
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  RxBool isLoading = RxBool(false);
  RxBool isLoading1 = RxBool(false);
  ApiReturnValue user =
      ApiReturnValue(value: null, message: '', statusCode: null);

  ApiReturnValue user1 =
      ApiReturnValue(value: null, message: '', statusCode: null);

  @override
  void onInit() {
    usernameC.text = '';
    passwordC.text = '';
    getHistory();

    super.onInit();
  }

  void login() async {
    try {
      isLoading.value = true;
      ApiReturnValue user1 =
          await AuthServices.login(usernameC.text, passwordC.text)
              as ApiReturnValue;

      user = user1;
    } finally {
      isLoading.value = false;
    }
  }

  void getHistory() async {
    try {
      isLoading1.value = true;
      ApiReturnValue user1 =
          await HistoryServices.getHistory() as ApiReturnValue;
      // ignore: unnecessary_cast
      user1 = user1;
      if (user1.statusCode == 200) {
        Get.offAllNamed(Routes.HOME);
      }
    } finally {
      isLoading1.value = false;
    }
  }
}
