part of 'models.dart';

class Rangking {
  Rangking({
    required this.name,
    required this.point,
    required this.id,
  });
  final String name;
  final int point;
  final int id;

  factory Rangking.fromJson(Map<String, dynamic> data) => Rangking(
        id: data['id'],
        name: data['name'],
        point: data['point'],
      );
  Rangking copyWith({
    String? name,
    int? point,
    required int id,
  }) {
    return Rangking(
      name: name ?? this.name,
      id: id,
      point: point ?? this.point,
    );
  }
}
