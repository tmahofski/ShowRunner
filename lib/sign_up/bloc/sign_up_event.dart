part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends SignUpEvent {
  const UsernameChanged({
    required this.username,
  });

  final String username;

  @override
  List<Object> get props => [username];
}

class EmailChanged extends SignUpEvent {
  const EmailChanged({
    required this.email,
  });

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignUpEvent {
  const PasswordChanged({
    required this.password,
  });

  final String password;

  @override
  List<Object> get props => [password];
}

class FormSubmitted extends SignUpEvent {}
