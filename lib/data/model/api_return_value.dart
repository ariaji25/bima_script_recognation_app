part of 'models.dart';

class ApiReturnValue<T> {
  late T value;
  late String message;
  late final int? statusCode;

  ApiReturnValue(
      {required this.value, required this.message, required this.statusCode});
}
