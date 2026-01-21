import 'global_imports.dart';
import 'core/services/user_storage_service.dart';
import 'feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'feature/wishlist/presentation/cubit/wishlist_get_cubit.dart';
import 'feature/forums/presentation/cubit/forums_cubit.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localization/locale_controller.dart';

var logger = Logger(printer: PrettyPrinter(colors: true, printEmojis: true));

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies before running app
  try {
    await EnvConstant.init();
    await HiveServices().init();
    await UserStorageService.init(); // Initialize UserStorageService
    await initGetIt();
    await getIt<AppServices>().initAppServices();
    HttpOverrides.global = MyHttpOverrides();
    Bloc.observer = AppBlocObserver();
  } catch (e) {
    logger.e("Init error: $e");
  }
  
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(title: const Text('Oops! An error occurred', style: AppTextStyle.headLine1)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 80),
            20.gap,
            Builder(
              builder: (context) {
                final t = Localizations.of<AppLocalizations>(
                  context,
                  AppLocalizations,
                );
                return Text(
                  t?.unknownError ?? 'Something went wrong!',
                  style: AppTextStyle.style18B,
                );
              },
            ),
            10.gap,
            Text(
              details.exceptionAsString(),
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  };

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LocaleController _localeController;

  @override
  void initState() {
    super.initState();
    _localeController = LocaleController();
    _localeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        ThemeCubit()
          ..init()),

        BlocProvider(create: (context) => getIt<ConnectionCubit>()),
        
        // Wishlist providers
        BlocProvider(create: (context) => getIt<WishlistCubit>()),
        BlocProvider(create: (context) => getIt<WishlistGetCubit>()),
        
        // Forums provider
        BlocProvider(create: (context) => getIt<ForumsCubit>()),
      ],
      child: LocaleScope(
        controller: _localeController,
        child: AnimatedBuilder(
          animation: _localeController,
          builder: (context, _) {
            return BlocBuilder<ThemeCubit, ThemeData>(
              builder: (context, theme) {
                // Apply Cairo font globally to the theme
                final cairoTheme = theme.copyWith(
                  textTheme: theme.textTheme.apply(
                    fontFamily: 'Cairo',
                  ),
                  appBarTheme: theme.appBarTheme.copyWith(
                    titleTextStyle: theme.textTheme.titleLarge?.copyWith(
                      fontFamily: 'Cairo',
                    ),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      textStyle: theme.textTheme.labelLarge?.copyWith(
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      textStyle: theme.textTheme.labelLarge?.copyWith(
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                  outlinedButtonTheme: OutlinedButtonThemeData(
                    style: OutlinedButton.styleFrom(
                      textStyle: theme.textTheme.labelLarge?.copyWith(
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                  inputDecorationTheme: theme.inputDecorationTheme.copyWith(
                    hintStyle: theme.inputDecorationTheme.hintStyle?.copyWith(
                      fontFamily: 'Cairo',
                    ),
                    labelStyle: theme.inputDecorationTheme.labelStyle?.copyWith(
                      fontFamily: 'Cairo',
                    ),
                  ),
                  dialogTheme: theme.dialogTheme.copyWith(
                    titleTextStyle: theme.textTheme.titleLarge?.copyWith(
                      fontFamily: 'Cairo',
                    ),
                    contentTextStyle: theme.textTheme.bodyMedium?.copyWith(
                      fontFamily: 'Cairo',
                    ),
                  ),
                );
                
                return BlocBuilder<ConnectionCubit, ConnectionState>(
                  builder: (context, state) {
                    return ScreenUtilInit(
                      builder: (_, child) {
                        return MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          locale: _localeController.locale,
                          supportedLocales: AppLocalizations.supportedLocales,
                          localizationsDelegates: const [
                            AppLocalizations.delegate,
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                          ],
                          theme: cairoTheme,
                          routerConfig: goRouters,
                          scaffoldMessengerKey:
                              GlobalContext.scaffoldMessengerKey,
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
