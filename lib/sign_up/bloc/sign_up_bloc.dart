import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_runner/models/login_models/email.dart';
import 'package:show_runner/models/login_models/password.dart';
import 'package:show_runner/models/login_models/username.dart';
import 'package:show_runner/repositories/abstract_authentication_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

const String emptyString = '';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required AbstractAuthenticationRepository authRepository})
      : _authRepository = authRepository,
        super(
          const SignUpInitial(),
        ) {
    on<UsernameChanged>(_usernameChanged);
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<FormSubmitted>(_formSubmitted);
  }

  final AbstractAuthenticationRepository _authRepository;

  void _usernameChanged(UsernameChanged event, Emitter<SignUpState> emit) {
    emit(
      SignUpInProgress(
        username: Username(value: event.username),
        email: state.email,
        password: state.password,
        usernameHasBeenChanged: true,
        emailHasBeenChanged: state.emailHasBeenChanged,
        passwordHasBeenChanged: state.passwordHasBeenChanged,
      ),
    );

    print(state.username.value);
  }

  void _emailChanged(EmailChanged event, Emitter<SignUpState> emit) {
    emit(
      SignUpInProgress(
        username: state.username,
        email: Email(value: event.email),
        password: state.password,
        usernameHasBeenChanged: state.usernameHasBeenChanged,
        emailHasBeenChanged: true,
        passwordHasBeenChanged: state.passwordHasBeenChanged,
      ),
    );
  }

  void _passwordChanged(PasswordChanged event, Emitter<SignUpState> emit) {
    emit(
      SignUpInProgress(
        username: state.username,
        email: state.email,
        password: Password(value: event.password),
        usernameHasBeenChanged: state.usernameHasBeenChanged,
        emailHasBeenChanged: state.emailHasBeenChanged,
        passwordHasBeenChanged: true,
      ),
    );
  }

  Future<void> _formSubmitted(
      FormSubmitted event, Emitter<SignUpState> emit) async {
    emit(
      SignUpSubmitting(
        username: state.username,
        email: state.email,
        password: state.password,
        usernameHasBeenChanged: state.usernameHasBeenChanged,
        emailHasBeenChanged: state.emailHasBeenChanged,
        passwordHasBeenChanged: state.passwordHasBeenChanged,
      ),
    );

    if (!state.username.isValid() ||
        !state.password.isValid() ||
        !state.email.isValid()) {
      emit(
        SignUpFailure(
          username: state.username,
          email: state.email,
          password: state.password,
          usernameHasBeenChanged: state.usernameHasBeenChanged,
          emailHasBeenChanged: state.emailHasBeenChanged,
          passwordHasBeenChanged: state.passwordHasBeenChanged,
        ),
      );
    }

    try {
      await _authRepository.signUp(
        username: state.username.value,
        email: state.email.value,
        password: state.password.value,
      );
      print('Completing');
      emit(
        SignUpComplete(
          username: state.username,
          email: state.email,
          password: state.password,
          usernameHasBeenChanged: state.usernameHasBeenChanged,
          emailHasBeenChanged: state.emailHasBeenChanged,
          passwordHasBeenChanged: state.passwordHasBeenChanged,
        ),
      );
    } catch (_) {
      emit(
        SignUpFailure(
          username: state.username,
          email: state.email,
          password: state.password,
          usernameHasBeenChanged: state.usernameHasBeenChanged,
          emailHasBeenChanged: state.emailHasBeenChanged,
          passwordHasBeenChanged: state.passwordHasBeenChanged,
        ),
      );
    }
  }
}
