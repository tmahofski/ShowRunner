import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:show_runner/repositories/abstract_authentication_repository.dart';
import 'package:show_runner/sign_up/bloc/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        authRepository: context.read<AbstractAuthenticationRepository>(),
      ),
      child: const SignUpListener(),
    );
  }
}

class SignUpListener extends StatelessWidget {
  const SignUpListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpComplete) {}
      },
      child: const SignUpBuilder(),
    );
  }
}

class SignUpBuilder extends StatelessWidget {
  const SignUpBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          if (state is SignUpInitial ||
              state is SignUpInProgress ||
              state is SignUpFailure) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(MdiIcons.account),
                    ),
                    obscureText: false,
                    onChanged: (input) {
                      context
                          .read<SignUpBloc>()
                          .add(UsernameChanged(username: input));
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(MdiIcons.email),
                    ),
                    obscureText: false,
                    onChanged: (input) {
                      context
                          .read<SignUpBloc>()
                          .add(EmailChanged(email: input));
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
                          .read<SignUpBloc>()
                          .add(PasswordChanged(password: input));
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      context.read<SignUpBloc>().add(FormSubmitted());
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text('Already have an account?'),
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
      ),
    );
  }
}
