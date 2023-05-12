import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:show_runner/auth/bloc/auth_bloc.dart';
import 'package:show_runner/login/view/login_page.dart';
import 'package:show_runner/main/view/main_page.dart';
import 'package:show_runner/sign_up/view/sign_up_page.dart';
import 'package:show_runner/splash/view/splash_page.dart';

class AppRouter {
  static GoRouter generateGoRouter() {
    GoRouter router = GoRouter(
      // refreshListenable: GoRouterRefreshListenable(bloc.stream),
      initialLocation: SplashPage.path,
      routes: <GoRoute>[
        GoRoute(
          path: SplashPage.path,
          name: SplashPage.name,
          builder: (context, state) => const SplashPage(),
        ),
        // GoRoute(
        //   path: LoginPage.path,
        //   name: LoginPage.name,
        //   builder: (context, state) => const LoginPage(),
        // ),
        // GoRoute(
        //   path: SignUpPage.path,
        //   name: SignUpPage.name,
        //   builder: (context, state) => const SignUpPage(),
        // ),
        // GoRoute(
        //   path: '/main',
        //   name: 'main',
        //   builder: (context, state) => const MainPage(),
        // ),
      ],
      // redirect: (context, state) {
      //   // bool isLoggedIn = bloc.state.user.isNotEmpty;
      //   // if (isLoggedIn && state.fullPath == '/login') {
      //   //   return '/main';
      //   // }

      //   // if (!isLoggedIn) {
      //   //   return '/login';
      //   // }

      //   // return null;
      //   return SplashPage.path;
      // },
    );

    return router;
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
