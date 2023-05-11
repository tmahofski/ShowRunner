import '../models/user.dart';

abstract class AbstractAuthenticationRepository {
  User currentUser = User.empty;

  Stream<User> get user;

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}
