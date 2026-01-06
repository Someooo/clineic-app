import '../../../global_imports.dart';
import '../data/datasource/profile_settings_remote_data_source.dart';
import '../data/repository/profile_settings_repository_impl.dart';
import '../domain/repository/profile_settings_repository.dart';
import '../domain/usecases/get_profile_settings_case.dart';
import '../domain/usecases/store_profile_settings_case.dart';
import '../presentation/cubit/profile_settings_cubit.dart';

/// Profile Dependency Injection
/// 
/// Registers:
/// - Remote Data Source: Handles API calls
/// - Repository: Business logic layer
/// - Use Cases: Get and Store profile settings
/// - Cubit: State management
void initProfileDI() {
  // Register Remote Data Source
  // Handles API calls to GET /v1/profile/setting and POST /v1/profile/store_profile_setting
  getIt.registerLazySingleton<ProfileSettingsRemoteDataSource>(
    () => ProfileSettingsRemoteDataSourceImpl(getIt()),
  );

  // Register Repository
  // Uses AuthLocalDataSource to get stored token from login
  getIt.registerLazySingleton<ProfileSettingsRepository>(
    () => ProfileSettingsRepositoryImpl(
      remote: getIt(),
      authLocalDataSource: getIt<AuthLocalDataSource>(),
    ),
  );

  // Register Use Cases
  getIt.registerLazySingleton<GetProfileSettingsCase>(
    () => GetProfileSettingsCase(getIt()),
  );

  getIt.registerLazySingleton<StoreProfileSettingsCase>(
    () => StoreProfileSettingsCase(getIt()),
  );

  // Register Cubit (Factory - creates new instance each time)
  // Manages profile settings state and handles API calls
  getIt.registerFactory(
    () => ProfileSettingsCubit(
      getProfileSettingsCase: getIt(),
      storeProfileSettingsCase: getIt(),
    ),
  );
}
