import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:show_runner/auth/bloc/auth_bloc.dart';
import 'package:show_runner/login/view/login_page.dart';
import 'package:show_runner/main/view/main_page.dart';
import 'package:show_runner/sign_up/view/sign_up_page.dart';
import 'package:show_runner/splash/view/splash_page.dart';

class AppRouter {
  static GoRouter generateRouter(Stream<AuthState> authStream) {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashPage(),
          routes: <GoRoute>[
            GoRoute(
              path: 'login',
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              path: 'signup',
              builder: (context, state) => const SignUpPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/main',
          builder: (context, state) => const MainPage(),
          routes: const <GoRoute>[],
        ),
      ],
      redirect: (context, state) {
        final isAuthenticated =
            context.read<AuthBloc>().state.appStatus == AppStatus.authenticated;
        final isLoggingIn = state.location == '/login';
        final isSigningUp = state.location == '/signup';

        if (!isAuthenticated) {
          if (isLoggingIn) {
            return state.location;
          }
          if (isSigningUp) {
            return state.location;
          }
          return '/login';
        }

        if (isAuthenticated) {
          return '/main';
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
