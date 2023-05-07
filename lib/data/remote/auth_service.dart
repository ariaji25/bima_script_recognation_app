part of 'services.dart';

class AuthServices {
  static var client = http.Client();

  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? value = prefs.getString('username');

    return value;
  }

  static Future<int?> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt('id');
  }

  static void persistToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static void persistId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', id);
  }

  static void persistUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  static void deleteToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<ApiReturnValue?> login(String email, String password) async {
    var response = await client.post(Uri.parse('$baseURL/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'username': email,
          'password': password,
        }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      User value = User.fromJson(data['data']['user']);
      persistToken(data['data']['access_token']);
      persistUsername(value.username!);
      persistId(value.id);

      return ApiReturnValue(
          value: value,
          statusCode: response.statusCode,
          message: data['meta']['message']);
    } else {
      var data = jsonDecode(response.body);
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
