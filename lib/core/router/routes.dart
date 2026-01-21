import '../../../../global_imports.dart';
import '../../feature/splash_screen/splash_screen.dart';
import '../../feature/auth/presentation/pages/auth_login_screen.dart';
import '../../feature/auth/presentation/pages/auth_register_screen.dart';
import '../../feature/home/home.dart';
import '../../feature/hospital/presentation/pages/hospitals_page.dart';
import '../../feature/home/presentation/pages/specialities_page.dart';
import '../../feature/profile/presentation/pages/profile_settings_screen.dart';
import '../../feature/wishlist/presentation/pages/wishlist_page.dart';
import '../../feature/wishlist/presentation/cubit/wishlist_get_cubit.dart';

GoRouter goRouters = GoRouter(
  navigatorKey: GlobalContext.navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: AppRoutes.root, builder: (_, __) => const SplashScreen()),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const AuthLoginPage(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const AuthRegisterPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.hospitals,
      builder: (context, state) => const HospitalsPage(),
    ),
    GoRoute(
      path: AppRoutes.specialities,
      builder: (context, state) => const SpecialitiesPage(),
    ),
    GoRoute(
      path: AppRoutes.profileSettings,
      builder: (context, state) => const ProfileSettingsScreen(),
    ),
    GoRoute(
      path: AppRoutes.wishlist,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<WishlistGetCubit>(),
        child: const WishlistPage(),
      ),
    ),
  ],
);
