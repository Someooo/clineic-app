import '../../../global_imports.dart';
import '../data/datasource/home_remote_data_source.dart';
import '../data/datasource/home_local_data_source.dart';
import '../data/repository/home_repository_impl.dart';
import '../domain/repository/home_repository.dart';
import '../domain/usecases/get_home_data_case.dart';
import '../domain/usecases/get_doctors_list_case.dart';
import '../presentation/cubit/home_cubit.dart';

void initHomeDI() {
  // Register Data Sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt()),
  );
  
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(
      // TODO: Add required parameters when implementing
      // secureStorage: getIt(),
      // box: getIt(),
    ),
  );

  // Register Repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remote: getIt(),
      local: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Register Use Cases
  getIt.registerLazySingleton<GetHomeDataCase>(
    () => GetHomeDataCase(getIt()),
  );
  
  getIt.registerLazySingleton<GetDoctorsListCase>(
    () => GetDoctorsListCase(getIt()),
  );

  // Register Cubit (Factory - creates new instance each time)
  getIt.registerFactory(
    () => HomeCubit(
      getHomeDataCase: getIt(),
      getDoctorsListCase: getIt(),
    ),
  );
}
