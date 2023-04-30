part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
    required this.emailHasBeenChanged,
    required this.passwordHasBeenChanged,
  });

  final Email email;
  final Password password;
  final bool emailHasBeenChanged;
  final bool passwordHasBeenChanged;

  @override
  List<Object> get props => [
        email,
        password,
        emailHasBeenChanged,
        passwordHasBeenChanged,
      ];
}

class LoginInitial extends LoginState {
  const LoginInitial({
    super.email = const Email(value: ''),
    super.password = const Password(value: ''),
    super.emailHasBeenChanged = false,
    super.passwordHasBeenChanged = false,
  });
}

class LoginInProgress extends LoginState {
  const LoginInProgress({
    required super.email,
    required super.password,
    required super.emailHasBeenChanged,
    required super.passwordHasBeenChanged,
  });

  @override
  List<Object> get props => [
        email,
        password,
        emailHasBeenChanged,
        passwordHasBeenChanged,
      ];
}

class LoginSubmitting extends LoginState {
  const LoginSubmitting({
    required super.email,
    required super.password,
    required super.emailHasBeenChanged,
    required super.passwordHasBeenChanged,
  });

  @override
  List<Object> get props => [
        email,
        password,
        emailHasBeenChanged,
        passwordHasBeenChanged,
      ];
}

class LoginDone extends LoginState {
  const LoginDone({
    required super.email,
    required super.password,
    super.emailHasBeenChanged = true,
    super.passwordHasBeenChanged = true,
  });

  @override
  List<Object> get props => [
        email,
        password,
        emailHasBeenChanged,
        passwordHasBeenChanged,
      ];
}

class LoginFailure extends LoginState {
  const LoginFailure({
    required super.email,
    required super.password,
    required super.emailHasBeenChanged,
    required super.passwordHasBeenChanged,
  });

  @override
  List<Object> get props => [
        email,
        password,
        emailHasBeenChanged,
        passwordHasBeenChanged,
      ];
}
