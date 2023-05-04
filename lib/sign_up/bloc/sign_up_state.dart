part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState({
    required this.username,
    required this.email,
    required this.password,
    required this.usernameHasBeenChanged,
    required this.emailHasBeenChanged,
    required this.passwordHasBeenChanged,
  });

  final Username username;
  final Email email;
  final Password password;
  final bool usernameHasBeenChanged;
  final bool emailHasBeenChanged;
  final bool passwordHasBeenChanged;

  @override
  List<Object> get props => [
        username,
        email,
        password,
        usernameHasBeenChanged,
        emailHasBeenChanged,
        passwordHasBeenChanged,
      ];
}

class SignUpInitial extends SignUpState {
  const SignUpInitial({
    super.username = const Username(value: ''),
    super.email = const Email(value: ''),
    super.password = const Password(value: ''),
    super.usernameHasBeenChanged = false,
    super.emailHasBeenChanged = false,
    super.passwordHasBeenChanged = false,
  });
}

class SignUpInProgress extends SignUpState {
  const SignUpInProgress({
    required super.username,
    required super.email,
    required super.password,
    required super.usernameHasBeenChanged,
    required super.emailHasBeenChanged,
    required super.passwordHasBeenChanged,
  });
}

class SignUpSubmitting extends SignUpState {
  const SignUpSubmitting({
    required super.username,
    required super.email,
    required super.password,
    required super.usernameHasBeenChanged,
    required super.emailHasBeenChanged,
    required super.passwordHasBeenChanged,
  });
}

class SignUpComplete extends SignUpState {
  const SignUpComplete({
    required super.username,
    required super.email,
    required super.password,
    required super.usernameHasBeenChanged,
    required super.emailHasBeenChanged,
    required super.passwordHasBeenChanged,
  });
}

class SignUpFailure extends SignUpState {
  const SignUpFailure({
    required super.username,
    required super.email,
    required super.password,
    required super.passwordHasBeenChanged,
    required super.usernameHasBeenChanged,
    required super.emailHasBeenChanged,
  });
}
