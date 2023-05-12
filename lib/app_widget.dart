import 'dart:async';

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:show_runner/login/view/login_page.dart';
import 'package:show_runner/main/view/main_page.dart';
import 'package:show_runner/navigation/app_router.dart';
import 'package:show_runner/routes.dart';
import 'package:show_runner/sign_up/view/sign_up_page.dart';
import 'package:show_runner/splash/view/splash_page.dart';

import 'auth/bloc/auth_bloc.dart';

// class AppWidget extends StatelessWidget {
//   const AppWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Show Runner',
//       home: FlowBuilder<AppStatus>(
//         state: context.select((AuthBloc bloc) => bloc.state.appStatus),
//         onGeneratePages: onGenerateAppViewPages,
//       ),
//     );
//   }
// }

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
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
              GoRoute(
                path: 'main',
                builder: (context, state) => const MainPage(),
              ),
            ],
          ),
        ],
        redirect: (context, state) {
          final isLoggedIn = context.read<AuthBloc>().state.appStatus ==
              AppStatus.authenticated;
          final isLoggingIn = state.location == '/login';
          final isSigningUp = state.location == '/signup';

          print('Running redirect function');
          print('Is Logged In: $isLoggedIn');

          if (isSigningUp) return 'signup';

          if (!isLoggedIn && !isLoggingIn) return 'login';

          if (isLoggedIn) {
            print('Is logged in');
            return '/main';
          }

          return null;
        },
        refreshListenable:
            GoRouterRefreshListenable(context.read<AuthBloc>().stream),
      ),
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
