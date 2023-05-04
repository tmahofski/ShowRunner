import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_runner/auth/bloc/auth_bloc.dart';
import 'package:show_runner/main/bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  static Page<void> page() => const MaterialPage<void>(child: MainPage());

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: const MainPageListener(),
    );
  }
}

class MainPageListener extends StatelessWidget {
  const MainPageListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {},
      child: const MainPageBuilder(),
    );
  }
}

class MainPageBuilder extends StatelessWidget {
  const MainPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        actions: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutRequested());
                },
                icon: const Icon(
                  Icons.logout_rounded,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
