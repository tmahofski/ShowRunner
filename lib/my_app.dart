import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_runner/app_widget.dart';
import 'package:show_runner/auth/bloc/auth_bloc.dart';
import 'package:show_runner/repositories/abstract_authentication_repository.dart';
import 'package:show_runner/repositories/abstract_database_repository.dart';

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
