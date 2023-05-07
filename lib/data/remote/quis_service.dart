part of 'services.dart';

class QuisServices {
  static var client = http.Client();

  static Future<ApiReturnValue?> getQuis() async {
    String? token = await AuthServices.getToken();

    if (token == null) {
      return ApiReturnValue(
          message: "Anda Belum Login", statusCode: 500, value: null);
    }

    var response = await client.get(
      Uri.parse('$baseURL/quis'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Question> value =
          (data['data'] as Iterable).map((e) => Question.fromJson(e)).toList();

      return ApiReturnValue(
          value: value,
          statusCode: response.statusCode,
          message: data['meta']['message']);
    } else {
      var data = jsonDecode(response.body);
      Get.toNamed(Routes.LOGIN);

      // print(response.statusCode);
      return ApiReturnValue(
          message: data['message'],
          statusCode: response.statusCode,
          value: null);
    }
  }

  static Future<ApiReturnValue?> storeQuis(List<Question> value) async {
    String? token = await AuthServices.getToken();
    var input = jsonEncode(value);
    print(input);

    if (token == null) {
      return ApiReturnValue(
          message: "Anda Belum Login", statusCode: 500, value: null);
    }

    var response = await client.post(Uri.parse('$baseURL/quis-store'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(<String, String>{
          'data': input,
        }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("data");
      print(data['data']['point']);
      Score value = Score.fromJson(data['data']);

      return ApiReturnValue(
          value: value,
          statusCode: response.statusCode,
          message: data['meta']['message']);
    } else {
      var data = jsonDecode(response.body);
      Get.toNamed(Routes.LOGIN);

      // print(response.statusCode);
      return ApiReturnValue(
          message: data['message'],
          statusCode: response.statusCode,
          value: null);
    }
  }
}
