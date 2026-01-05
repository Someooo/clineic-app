import '../../../../global_imports.dart';
import '../../feature/splash_screen/splash_screen.dart';
import '../../feature/auth/presentation/pages/auth_login_screen.dart';

GoRouter goRouters = GoRouter(
  navigatorKey: GlobalContext.navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: AppRoutes.root, builder: (_, __) => const SplashScreen()),
    GoRoute(path: AppRoutes.login, builder: (context, state) => const AuthLoginPage()),

    ],
);
