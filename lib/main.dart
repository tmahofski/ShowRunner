import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:show_runner/firebase_options.dart';
import 'package:show_runner/my_app.dart';
import 'package:show_runner/repositories/authentication_repository.dart';
import 'package:show_runner/repositories/database_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final DatabaseRepository databaseRepository = DatabaseRepository();

  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository(
    firebaseAuth: firebaseAuth,
    databaseRepository: databaseRepository,
  );

  runApp(
    MyApp(
      databaseRepository: databaseRepository,
      authenticationRepository: authenticationRepository,
    ),
  );
}
