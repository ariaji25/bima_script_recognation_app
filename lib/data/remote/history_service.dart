part of 'services.dart';

class HistoryServices {
  static var client = http.Client();

  static Future<ApiReturnValue?> getHistory() async {
    String? token = await AuthServices.getToken();

    if (token == null) {
      return ApiReturnValue(
          message: "Anda Belum Login", statusCode: 500, value: null);
    }

    var response = await client.get(
      Uri.parse('$baseURL/history'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Rangking> value =
          (data['data'] as Iterable).map((e) => Rangking.fromJson(e)).toList();

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

  static Future<ApiReturnValue?> logout() async {
    String? token = await AuthServices.getToken();

    var response = await client.get(
      Uri.parse('$baseURL/logout'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token!}"
      },
    );

    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      var data = jsonDecode(response.body);
      // User user = User.fromJson(data.result.user);
      final pref = await SharedPreferences.getInstance();
      await pref.clear();

      return ApiReturnValue(
          message: "berhasil", statusCode: response.statusCode, value: null);
    } else {
      return ApiReturnValue(
          message: "Somthing wrong",
          statusCode: response.statusCode,
          value: null);
    }
  }
}
