import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:show_runner/login/bloc/login_bloc.dart';
import 'package:show_runner/repositories/abstract_authentication_repository.dart';
import 'package:show_runner/sign_up/view/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  static String path = '/login';
  static String name = 'login';
  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          authenticationRepository:
              context.read<AbstractAuthenticationRepository>(),
        ),
        child: const SafeArea(child: LoginListener()),
      ),
    );
  }
}

class LoginListener extends StatelessWidget {
  const LoginListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {},
      child: const LoginBuilder(),
    );
  }
}

class LoginBuilder extends StatelessWidget {
  const LoginBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial ||
            state is LoginInProgress ||
            state is LoginFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(MdiIcons.email),
                  ),
                  obscureText: false,
                  onChanged: (input) {
                    context.read<LoginBloc>().add(EmailChanged(email: input));
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(MdiIcons.lock),
                  ),
                  obscureText: true,
                  onChanged: (input) {
                    context
                        .read<LoginBloc>()
                        .add(PasswordChanged(password: input));
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  child: const Text('Submitted'),
                  onPressed: () {
                    context.read<LoginBloc>().add(const FormSubmitted());
                  },
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).push<void>(SignUpPage.route());
                    context.go('/signup');
                  },
                  child: const Text('Don\'t have an account?'),
                ),
                const Spacer(),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
