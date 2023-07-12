import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_runner/models/email.dart';
import 'package:show_runner/models/password.dart';
import 'package:show_runner/models/username.dart';
import 'package:show_runner/repositories/abstract_authentication_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

const String emptyString = '';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required AbstractAuthenticationRepository authRepository})
      : _authRepository = authRepository,
        super(
          initState(),
        ) {
    on<UsernameChanged>(_usernameChanged);
    on<EmailChanged>(_emailChanged);
    on<EmailUnFocused>(_emailUnFocused);
    on<EmailFocused>(_emailFocused);
    on<PasswordChanged>(_passwordChanged);
    on<PasswordFocused>(_passwordFocused);
    on<PasswordUnFocused>(_passwordUnFocused);
    on<FormSubmitted>(_formSubmitted);
    on<UsernameUnFocused>(_usernameUnFocused);
    on<UsernameFocused>(_usernameFocused);
  }

  final AbstractAuthenticationRepository _authRepository;

  void _usernameUnFocused(UsernameUnFocused event, Emitter<SignUpState> emit) {
    emit(SignUpState(
        username: Username(
            value: state.username.value, isDirty: true, hasFocus: false),
        email: state.email,
        password: state.password,
        formState: SignUpFormSate.signUpInProgress));
  }

  void _usernameFocused(UsernameFocused event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      username: Username(
          value: state.username.value,
          isDirty: state.username.isDirty,
          hasFocus: true),
    ));
  }

  void _usernameChanged(UsernameChanged event, Emitter<SignUpState> emit) {
    emit(
      SignUpState(
          username: Username(
              value: event.username,
              isDirty: state.username.isDirty,
              hasFocus: state.username.hasFocus),
          email: state.email,
          password: state.password,
          formState: SignUpFormSate.signUpInProgress),
    );
  }

  void _emailChanged(EmailChanged event, Emitter<SignUpState> emit) {
    emit(
      SignUpState(
          username: state.username,
          email: Email(
              value: event.email,
              isDirty: state.email.isDirty,
              hasFocus: state.email.hasFocus),
          password: state.password,
          formState: SignUpFormSate.signUpInProgress),
    );
  }

  void _emailUnFocused(EmailUnFocused event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
        email:
            Email(value: state.email.value, isDirty: true, hasFocus: false)));
  }

  void _emailFocused(EmailFocused event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
        email: Email(
            value: state.email.value,
            isDirty: state.email.isDirty,
            hasFocus: true)));
  }

  void _passwordChanged(PasswordChanged event, Emitter<SignUpState> emit) {
    emit(
      SignUpState(
          username: state.username,
          email: state.email,
          password: Password(
              value: event.password,
              isDirty: state.password.isDirty,
              hasFocus: state.password.hasFocus),
          formState: SignUpFormSate.signUpInProgress),
    );
  }

  void _passwordUnFocused(PasswordUnFocused event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
        password: Password(
            value: state.password.value, isDirty: true, hasFocus: false)));
  }

  void _passwordFocused(PasswordFocused event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
        password: Password(
            value: state.password.value,
            isDirty: state.password.isDirty,
            hasFocus: false)));
  }

  Future<void> _formSubmitted(
      FormSubmitted event, Emitter<SignUpState> emit) async {
    emit(
      SignUpState(
          username: state.username,
          email: state.email,
          password: state.password,
          formState: SignUpFormSate.signUpInProgress),
    );

    if (!state.username.isValid() ||
        !state.password.isValid() ||
        !state.email.isValid()) {
      emit(
        SignUpState(
            username: Username(
                value: state.username.value, isDirty: true, hasFocus: false),
            email:
                Email(value: state.email.value, isDirty: true, hasFocus: false),
            password: Password(
                value: state.password.value, isDirty: true, hasFocus: false),
            formState: SignUpFormSate.signUpFailure),
      );
    }

    try {
      await _authRepository.signUp(
        username: state.username.value,
        email: state.email.value,
        password: state.password.value,
      );
      emit(
        SignUpState(
            username: state.username,
            email: state.email,
            password: state.password,
            formState: SignUpFormSate.signUpInProgress),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        SignUpState(
            username: state.username,
            email: state.email,
            password: state.password,
            formState: SignUpFormSate.signUpFailure),
      );
    }
  }
}
