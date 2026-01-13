import '../../../../global_imports.dart';
import '../../feature/home/di/home_di.dart';
import '../../feature/profile/di/profile_di.dart';
import '../../feature/doctor_detail/di/doctor_detail_di.dart';
import '../../feature/hospital/di/hospital_di.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  //======================== Dio ===============================================
  getIt.registerSingleton<AppServices>(AppServices());
  final appBox = await Hive.openBox(BoxKey.appBox);
  getIt.registerSingleton<Box>(appBox, instanceName: BoxKey.appBox);
  //======================== Services ==========================================
  getIt.registerLazySingleton<HeadersProvider>(
    () => HeadersProvider(hive: getIt<Box>(instanceName: BoxKey.appBox)),
  );
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(Connectivity()),
  );
  getIt.registerLazySingleton(() => ConnectionCubit(getIt<NetworkInfo>()));

  //======================== Hive Boxes ========================================

  AndroidOptions getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  getIt.registerSingleton<FlutterSecureStorage>(
    FlutterSecureStorage(aOptions: getAndroidOptions()),
  );

  //======================== Features  =========================================

  initAuthDI();
  initHomeDI();
  initProfileDI();
  initDoctorDetailDI();
  initHospitalDI();
}
