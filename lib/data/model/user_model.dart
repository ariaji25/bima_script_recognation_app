part of 'models.dart';

// ignore: must_be_immutable
class User extends Equatable {
  int id;
  String? username;
  String? token;

  User({required this.id, this.username, this.token});

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        username: data['username'],
        token: data['token'],
      );
  User copyWith({
    String? username,
    String? token,
    required int id,
  }) {
    return User(
      username: username ?? this.username,
      id: id,
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [
        id,
        username ?? '',
      ];
}
