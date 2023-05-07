part of 'models.dart';

class Option {
  final String code;
  final String text;

  const Option({
    required this.text,
    required this.code,
  });
  factory Option.fromJson(Map<String, dynamic> data) => Option(
        code: data['code'],
        text: data['name'],
      );
  Option copyWith({
    String? text,
    required String code,
  }) {
    return Option(
      text: text ?? this.text,
      code: code,
    );
  }
}
