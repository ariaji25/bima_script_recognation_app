import 'dart:async';

import 'package:bima_apps/data/model/models.dart';
import 'package:bima_apps/data/remote/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';

class ScoreViewModel extends GetxController {
  RxBool isLoading = RxBool(false);

  Score point = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }
}
