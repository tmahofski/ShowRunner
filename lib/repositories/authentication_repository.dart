import 'package:show_runner/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:show_runner/repositories/abstract_authentication_repository.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';

class AuthenticationRepository implements AbstractAuthenticationRepository {
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    required AbstractDatabaseRepository databaseRepository,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _databaseRepository = databaseRepository;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final AbstractDatabaseRepository _databaseRepository;

  @override
  User currentUser = User.empty;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (_) {
      // TODO: Handle exception
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on Exception catch (_) {
      // TODO: Handle exception
      rethrow;
    }
  }

  @override
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    print('Sign up');
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _firebaseAuth.currentUser?.updateDisplayName(username);
    await _firebaseAuth.currentUser?.reload();
    print('Sign up complete');
    //TODO: Add user to database
    // await _databaseRepository.addUserToDatabase(user: currentUser);
  }

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
