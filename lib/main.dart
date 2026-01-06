
import 'global_imports.dart';

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
  EasyLocalization.ensureInitialized();
  
  // Initialize dependencies before running the app
  try {
    await EnvConstant.init();
    await HiveServices().init();
    await initGetIt();
    await getIt<AppServices>().initAppServices();
    HttpOverrides.global = MyHttpOverrides();
    Bloc.observer = AppBlocObserver();
  } catch (e) {
    logger.e("Init error: $e");
  }
  
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(title: const Text('Oops! An error occurred')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 80),
            20.gap,
            Text(AppStrings.unknownError.tr(), style: AppTextStyle.style18B),
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
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      path: '/',
      assetLoader: CodeAssetLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        ThemeCubit()
          ..init()),

        BlocProvider(create: (context) => getIt<ConnectionCubit>())],
      child: Builder(
        builder: (context) {
          return BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, theme) {
              return BlocBuilder<ConnectionCubit, ConnectionState>(
                builder: (context, state) {
                  return ScreenUtilInit(
                    builder: (_, child) {
                      return MaterialApp.router(
                        key: ValueKey('locale_${context.locale.toString()}'),
                        debugShowCheckedModeBanner: false,
                        localizationsDelegates: context.localizationDelegates,
                        supportedLocales: context.supportedLocales,
                        locale: context.locale,
                        // theme: ThemeData(
                        //   useMaterial3: true,
                        //   appBarTheme: const AppBarTheme(centerTitle: true),
                        //   fontFamily: 'Almarai',
                        // ),
                        theme: theme,
                        routerConfig: goRouters,
                        scaffoldMessengerKey: GlobalContext
                            .scaffoldMessengerKey,
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
