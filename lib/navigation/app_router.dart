import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:show_runner/auth/bloc/auth_bloc.dart';
import 'package:show_runner/create_show/bloc/create_show_bloc.dart';
import 'package:show_runner/create_show/view/create_show_page.dart';
import 'package:show_runner/login/view/login_page.dart';
import 'package:show_runner/main/view/main_page.dart';
import 'package:show_runner/navigation/routes.dart';
import 'package:show_runner/sign_up/view/sign_up_page.dart';
import 'package:show_runner/splash/view/splash_page.dart';

class AppRouter {
  static GoRouter generateRouter(Stream<AuthState> authStream) {
    return GoRouter(
      initialLocation: kInitialRoute,
      routes: [
        GoRoute(
          path: kInitialRoute,
          builder: (context, state) => const SplashPage(),
          routes: <GoRoute>[
            GoRoute(
              path: kLoginName,
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              path: kSignUpName,
              builder: (context, state) => const SignUpPage(),
            ),
          ],
        ),
        GoRoute(
          path: kMainPath,
          builder: (context, state) => const MainPage(),
          routes: const <GoRoute>[],
        ),
        GoRoute(
          path: kCreatingShowPath,
          builder: (context, state) => const CreateShowPage(),
        )
      ],
      redirect: (context, state) {
        final isAuthenticated =
            context.read<AuthBloc>().state.appStatus == AppStatus.authenticated;
        final bool isLoggingIn = state.location == kLoginPath;
        final bool isSigningUp = state.location == kSignUpPath;

        final bool isOnMainPage = state.location == kMainPath;
        final bool isCreatingNewShow = state.location == kCreatingShowPath;

        if (!isAuthenticated) {
          if (isLoggingIn) {
            return state.location;
          }
          if (isSigningUp) {
            return state.location;
          }
          return kLoginPath;
        }

        if (isAuthenticated) {
          if (isOnMainPage) {
            return kMainPath;
          }

          if (isCreatingNewShow) {
            return kCreatingShowPath;
          }
          return kMainPath;
        }

        return null;
      },
      refreshListenable: GoRouterRefreshListenable(authStream),
    );
  }
}

class GoRouterRefreshListenable extends ChangeNotifier {
  GoRouterRefreshListenable(Stream stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (_) {
        notifyListeners();
      },
    );
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
