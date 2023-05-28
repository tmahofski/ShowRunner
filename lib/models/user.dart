import 'package:equatable/equatable.dart';

enum UserAuthority { owner, staff, attendee }

class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.username,
  });

  final String id;
  final String? email;
  final String? username;

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  factory User.fromJson(Map<String, dynamic> json) {
    final String id = json['id'];
    final String email = json['email'];
    final String username = json['username'];

    return User(
      id: id,
      email: email,
      username: username,
    );
  }

  @override
  List<Object?> get props => [email, id, username];
}
