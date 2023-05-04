import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_runner/models/user.dart';
import 'package:show_runner/repositories/abstract_authentication_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AbstractAuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthState.unauthenticated()) {
    on<UserChanged>(_onUserChanged);
    on<LogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(UserChanged(user: user)),
    );
  }

  final AbstractAuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(UserChanged event, Emitter<AuthState> emit) {
    print('User changed');
    event.user.isNotEmpty
        ? emit(AuthState.authenticated(event.user))
        : emit(const AuthState.unauthenticated());
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    try {
      await _authenticationRepository.logout();
    } catch (_) {}
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
