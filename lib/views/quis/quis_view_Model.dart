import 'dart:convert';

import 'package:bima_apps/data/model/models.dart';
import 'package:bima_apps/data/remote/services.dart';
import 'package:bima_apps/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuisViewModel extends GetxController {
  late Question question;
  RxBool isLoading = RxBool(false);
  RxBool isLoading1 = RxBool(false);

  RxInt page = 0.obs;
  List<Question> questions1 = questions;
  ApiReturnValue quis =
      ApiReturnValue(value: null, message: '', statusCode: null);
  ApiReturnValue hasil =
      ApiReturnValue(value: null, message: '', statusCode: null);

  @override
  void onInit() {
    getHistory();

    super.onInit();
  }

  void getHistory() async {
    try {
      isLoading.value = true;

      ApiReturnValue user1 = await QuisServices.getQuis() as ApiReturnValue;
      quis = user1;
    } finally {
      isLoading.value = false;
    }
  }

  void storeQuis() async {
    try {
      isLoading.value = true;

      ApiReturnValue user1 =
          await QuisServices.storeQuis(quis.value) as ApiReturnValue;
      hasil = user1;

      if (hasil.statusCode == 200) {
        Get.offAllNamed(Routes.SCORE, arguments: hasil.value);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void reload() {
    try {
      isLoading1.value = true;
    } finally {
      isLoading1.value = false;
    }
  }
}
