import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_runner/auth/bloc/auth_bloc.dart';
import 'package:show_runner/firebase_options.dart';
import 'package:show_runner/repositories/abstract_authentication_repository.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';
import 'package:show_runner/repositories/authentication_repository.dart';
import 'package:show_runner/repositories/database_repository.dart';
import 'package:show_runner/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final DatabaseRepository databaseRepository = DatabaseRepository();

  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository(
    databaseRepository: databaseRepository,
  );

  runApp(
    MyApp(
      databaseRepository: databaseRepository,
      authenticationRepository: authenticationRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    required AbstractDatabaseRepository databaseRepository,
    required AbstractAuthenticationRepository authenticationRepository,
    super.key,
  })  : _databaseRepository = databaseRepository,
        _authenticationRepository = authenticationRepository;

  final AbstractDatabaseRepository _databaseRepository;
  final AbstractAuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => _databaseRepository),
        RepositoryProvider(create: (context) => _authenticationRepository),
      ],
      child: BlocProvider(
        create: (context) =>
            AuthBloc(authenticationRepository: _authenticationRepository),
        child: const AppWidget(),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Runner',
      home: FlowBuilder<AppStatus>(
        state: context.select((AuthBloc bloc) => bloc.state.appStatus),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
