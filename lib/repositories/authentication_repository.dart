import 'package:show_runner/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:show_runner/repositories/abstract_authentication_repository.dart';

class AuthenticationRepository implements AbstractAuthenticationRepository {
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  User currentUser = User.empty;

  @override
  Future<void> login({required String email, required String password}) async {}

  @override
  Future<void> logout() async {}

  @override
  Future<void> signUp({required String username, required String email, required String password}) async {}

  @override
  Stream<User> get user {
    return _firebaseAuth.userChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, username: displayName);
  }
}
