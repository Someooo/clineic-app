import '../../../global_imports.dart';
import '../data/datasource/hospital_remote_data_source.dart';
import '../data/repository/hospital_repository_impl.dart';
import '../domain/repository/hospital_repository.dart';
import '../domain/usecases/get_hospitals_list_case.dart';
import '../presentation/cubit/hospital_cubit.dart';

void initHospitalDI() {
  // Register Data Sources
  getIt.registerLazySingleton<HospitalRemoteDataSource>(
    () => HospitalRemoteDataSourceImpl(getIt()),
  );

  // Register Repository
  getIt.registerLazySingleton<HospitalRepository>(
    () => HospitalRepositoryImpl(remote: getIt(), networkInfo: getIt()),
  );

  // Register Use Cases
  getIt.registerLazySingleton<GetHospitalsListCase>(
    () => GetHospitalsListCase(getIt()),
  );

  // Register Cubit (Factory - creates new instance each time)
  getIt.registerFactory(() => HospitalCubit(getHospitalsListCase: getIt()));
}
