part of 'auth_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState._({
    required this.appStatus,
    this.user = User.empty,
  });

  const AuthState.authenticated(User user)
      : this._(
          appStatus: AppStatus.authenticated,
          user: user,
        );

  const AuthState.unauthenticated()
      : this._(
          appStatus: AppStatus.unauthenticated,
        );

  final AppStatus appStatus;
  final User user;

  @override
  List<Object> get props => [appStatus, user];
}
