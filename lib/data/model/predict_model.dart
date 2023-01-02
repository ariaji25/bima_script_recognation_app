import 'package:bima_apps/data/model/base_model.dart';

class PredictModel {
  String? message;
  String? predictResult;
  String? expectedResult;
  double? predictPercentage;

  PredictModel(
      {this.message,
      this.predictResult,
      this.expectedResult,
      this.predictPercentage});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['predictResult'] = this.predictResult;
    data['expectedResult'] = this.expectedResult;
    data['predictPercentage'] = this.predictPercentage;
    return data;
  }

  PredictModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    predictResult = json['predictResult'];
    expectedResult = json['expectedResult'];
    predictPercentage = json['predictPercentage'];
  }
}
