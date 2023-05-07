part of 'models.dart';

class Score {
  Score({
    required this.point,
  });
  final String point;

  factory Score.fromJson(Map<String, dynamic> data) => Score(
        point: data['point'],
      );
  Score copyWith({
    String? point,
  }) {
    return Score(
      point: point ?? this.point,
    );
  }
}
