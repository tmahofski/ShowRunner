import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:show_runner/navigation/routes.dart';
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
      child: const SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _userNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _userNameFocusNode.addListener(() {
      if (!_userNameFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(UsernameUnFocused());
      } else {
        context.read<SignUpBloc>().add(UsernameFocused());
      }
    });

    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(EmailUnFocused());
      } else {
        context.read<SignUpBloc>().add(EmailFocused());
      }
    });

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<SignUpBloc>().add(PasswordUnFocused());
      } else {
        context.read<SignUpBloc>().add(PasswordFocused());
      }
    });
  }

  @override
  void dispose() {
    _userNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          if (state.formState == SignUpFormSate.signUpInitial ||
              state.formState == SignUpFormSate.signUpInProgress ||
              state.formState == SignUpFormSate.signUpFailure) {
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
                  UserNameInput(focusNode: _userNameFocusNode),
                  EmailInput(focusNode: _emailFocusNode),
                  PasswordInput(focusNode: _passwordFocusNode),
                  const Spacer(),
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      context.read<SignUpBloc>().add(FormSubmitted());
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(kLoginPath);
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

class EmailInput extends StatelessWidget {
  const EmailInput({required this.focusNode, super.key});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          focusNode: focusNode,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            labelText: 'email',
            errorText: state.email.displayError(),
          ),
          onChanged: (value) {
            context.read<SignUpBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class UserNameInput extends StatelessWidget {
  const UserNameInput({required this.focusNode, super.key});
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.username.value,
          focusNode: focusNode,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.verified_user),
              labelText: 'Username',
              errorText: state.username.displayError()),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<SignUpBloc>().add(UsernameChanged(username: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({required this.focusNode, super.key});
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.username.value,
          focusNode: focusNode,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password),
              labelText: 'Password',
              errorText: state.password.displayError()),
          obscureText: true,
          onChanged: (value) {
            context.read<SignUpBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
