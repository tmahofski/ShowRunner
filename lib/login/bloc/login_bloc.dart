import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_runner/models/email.dart';
import 'package:show_runner/models/password.dart';
import 'package:show_runner/repositories/abstract_authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
      {required AbstractAuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const LoginInitial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  final AbstractAuthenticationRepository _authenticationRepository;

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(
      LoginInProgress(
          email: Email(value: event.email),
          password: state.password,
          emailHasBeenChanged: true,
          passwordHasBeenChanged: state.passwordHasBeenChanged),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      LoginInProgress(
        email: state.email,
        password: Password(value: event.password),
        emailHasBeenChanged: state.emailHasBeenChanged,
        passwordHasBeenChanged: true,
      ),
    );
  }

  Future<void> _onFormSubmitted(
      FormSubmitted event, Emitter<LoginState> emit) async {
    emit(
      LoginSubmitting(
        email: state.email,
        password: state.password,
        emailHasBeenChanged: state.emailHasBeenChanged,
        passwordHasBeenChanged: state.passwordHasBeenChanged,
      ),
    );
    if (!state.email.isValid() || !state.password.isValid()) {
      emit(
        LoginFailure(
          email: state.email,
          password: state.password,
          emailHasBeenChanged: state.emailHasBeenChanged,
          passwordHasBeenChanged: state.passwordHasBeenChanged,
        ),
      );
      return;
    }

    try {
      await _authenticationRepository.login(
          email: state.email.value, password: state.password.value);
      emit(
        LoginComplete(email: state.email, password: state.password),
      );
    } on Exception catch (_) {
      emit(
        LoginFailure(
          email: state.email,
          password: state.password,
          emailHasBeenChanged: state.emailHasBeenChanged,
          passwordHasBeenChanged: state.passwordHasBeenChanged,
        ),
      );
    }
  }
}
