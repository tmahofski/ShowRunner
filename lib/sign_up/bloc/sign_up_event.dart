part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class UsernameUnFocused extends SignUpEvent {}

class UsernameFocused extends SignUpEvent {}

class UsernameChanged extends SignUpEvent {
  const UsernameChanged({
    required this.username,
  });

  final String username;

  @override
  List<Object> get props => [username];
}

class EmailUnFocused extends SignUpEvent {}

class EmailFocused extends SignUpEvent {}

class EmailChanged extends SignUpEvent {
  const EmailChanged({
    required this.email,
  });

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordFocused extends SignUpEvent {}

class PasswordUnFocused extends SignUpEvent {}

class PasswordChanged extends SignUpEvent {
  const PasswordChanged({
    required this.password,
  });

  final String password;

  @override
  List<Object> get props => [password];
}

class FormSubmitted extends SignUpEvent {}
