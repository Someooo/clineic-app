import '../../../global_imports.dart';
import '../data/datasource/doctor_detail_remote_data_source.dart';
import '../data/repository/doctor_detail_repository_impl.dart';
import '../domain/repository/doctor_detail_repository.dart';
import '../domain/usecases/get_doctor_detail_case.dart';
import '../presentation/cubit/doctor_detail_cubit.dart';

void initDoctorDetailDI() {
  // Register Data Sources
  getIt.registerLazySingleton<DoctorDetailRemoteDataSource>(
    () => DoctorDetailRemoteDataSourceImpl(getIt()),
  );

  // Register Repository
  getIt.registerLazySingleton<DoctorDetailRepository>(
    () => DoctorDetailRepositoryImpl(remote: getIt(), networkInfo: getIt()),
  );

  // Register Use Cases
  getIt.registerLazySingleton<GetDoctorDetailCase>(
    () => GetDoctorDetailCase(getIt()),
  );

  // Register Cubit (Factory - creates new instance each time)
  getIt.registerFactory(() => DoctorDetailCubit(getDoctorDetailCase: getIt()));
}
