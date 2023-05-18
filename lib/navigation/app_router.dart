// import 'package:go_router/go_router.dart';
// import 'package:show_runner/auth/bloc/auth_bloc.dart';

// class AppRouter {
//   static GoRouter generateRouter(Stream<AuthState> authStream) {
//     return GoRouter(
//       initialLocation: '/',
//       routes: [
//         GoRoute(
//           path: '/',
//           builder: (context, state) => const SplashPage(),
//           routes: <GoRoute>[
//             GoRoute(
//               path: 'login',
//               builder: (context, state) => const LoginPage(),
//             ),
//             GoRoute(
//               path: 'signup',
//               builder: (context, state) => const SignUpPage(),
//             ),
//           ],
//         ),
//         GoRoute(
//           path: '/main',
//           builder: (context, state) => const MainPage(),
//           routes: const <GoRoute>[],
//         ),
//       ],
//       redirect: (context, state) {
//         final isAuthenticated =
//             context.read<AuthBloc>().state.appStatus == AppStatus.authenticated;
//         final isLoggingIn = state.location == '/login';
//         final isSigningUp = state.location == '/signup';

//         if (!isAuthenticated) {
//           if (isLoggingIn) {
//             return state.location;
//           }
//           if (isSigningUp) {
//             return state.location;
//           }
//           return '/login';
//         }

//         if (isAuthenticated) {
//           return '/main';
//         }

//         return null;
//       },
//       refreshListenable:
//           GoRouterRefreshListenable(context.read<AuthBloc>().stream),
//     );
//   }
// }

// class GoRouterRefreshListenable extends ChangeNotifier {
//   GoRouterRefreshListenable(Stream stream) {
//     notifyListeners();
//     _subscription = stream.asBroadcastStream().listen(
//       (_) {
//         notifyListeners();
//       },
//     );
//   }

//   late final StreamSubscription _subscription;

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }
