part of 'sign_up_bloc.dart';

enum SignUpFormSate { signUpInitial, signUpInProgress, signUpFailure }

class SignUpState extends Equatable {
  const SignUpState(
      {required this.username,
      required this.email,
      required this.password,
      required this.formState});

  final Username username;
  final Email email;
  final Password password;
  final SignUpFormSate formState;

  @override
  List<Object> get props => [
        username,
        email,
        password,
      ];

  SignUpState copyWith({
    Username? username,
    Email? email,
    Password? password,
    SignUpFormSate? formState,
  }) {
    return SignUpState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        formState: formState ?? this.formState);
  }
}

initState() {
  return const SignUpState(
      username: Username(value: '', isDirty: false, hasFocus: false),
      email: Email(value: '', isDirty: false, hasFocus: false),
      password: Password(value: '', isDirty: false, hasFocus: false),
      formState: SignUpFormSate.signUpInitial);
}
