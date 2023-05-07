import 'dart:async';

import 'package:bima_apps/data/model/models.dart';
import 'package:bima_apps/data/remote/services.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class RangkingViewModel extends GetxController {
  RxBool isLoading = RxBool(false);
  ApiReturnValue history =
      ApiReturnValue(value: null, message: '', statusCode: null);

  @override
  void onInit() {
    getHistory();
    super.onInit();
  }

  void getHistory() async {
    try {
      isLoading.value = true;

      ApiReturnValue user1 =
          await HistoryServices.getHistory() as ApiReturnValue;
      history = user1;
      print(history);
    } finally {
      isLoading.value = false;
    }
  }
}
