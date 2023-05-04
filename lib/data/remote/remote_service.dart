import 'package:bima_apps/data/model/base_model.dart';
import 'package:bima_apps/data/model/predict_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RemoteServices {
  final dioClient = Dio(BaseOptions(baseUrl: "http://0.0.0.0:8000"));

  Future<BaseModel<PredictModel>> predictImage<T>(Uint8List image) async {
    var data = BaseModel<PredictModel>();
    var _response = await dioClient.post("/api/v1/predict/:id?id=0",
        data: FormData.fromMap(
          {
            "file": MultipartFile.fromBytes(
              image,
              filename: "test.jpeg",
            )
          },
        ),
        options: Options(contentType: "multipart/form-data"));
    data.data = PredictModel.fromJson(_response.data);
    return Future.value(data);
  }
}
