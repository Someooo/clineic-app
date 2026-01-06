import '../../../../global_imports.dart';
import '../../feature/splash_screen/splash_screen.dart';
import '../../feature/auth/presentation/pages/auth_login_screen.dart';
import '../../feature/auth/presentation/pages/auth_register_screen.dart';
import '../../feature/home/home.dart';

GoRouter goRouters = GoRouter(
  navigatorKey: GlobalContext.navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: AppRoutes.root, builder: (_, __) => const SplashScreen()),
    GoRoute(path: AppRoutes.login, builder: (context, state) => const AuthLoginPage()),
    GoRoute(path: AppRoutes.register, builder: (context, state) => const AuthRegisterPage()),
    GoRoute(path: AppRoutes.home, builder: (context, state) => const HomePage()),
  ],
);
