import '../../../../global_imports.dart';
import '../../domain/repository/home_repository.dart';
import '../../domain/entities/doctor_entity.dart';
import '../../domain/entities/hospital_entity.dart';
import '../../domain/mappers/doctor_mapper.dart';
import '../../domain/mappers/hospital_mapper.dart';
import '../datasource/home_remote_data_source.dart';
import '../datasource/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;
  final HomeLocalDataSource local;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.networkInfo,
    required this.remote,
    required this.local,
  });

  @override
  Future<Either<Failure, ApiResponse<DoctorEntity>>> getDoctorsList({
    required CancelToken cancelToken,
  }) async {
    try {
      final hasConnection = await networkInfo.isConnected;
      
      if (!hasConnection) {
        return left(ServerFailure(message: 'No internet connection'));
      }

      final apiResponse = await remote.getDoctorsList(
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError && apiResponse.list != null) {
        final entityResponse = apiResponse.map((model) => model.toEntity());
        return right(entityResponse);
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }

  @override
  Future<Either<Failure, ApiResponse<HospitalEntity>>> getHospitalsList({
    required CancelToken cancelToken,
  }) async {
    try {
      final hasConnection = await networkInfo.isConnected;
      
      if (!hasConnection) {
        return left(ServerFailure(message: 'No internet connection'));
      }

      final apiResponse = await remote.getHospitalsList(
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError && apiResponse.list != null) {
        final entityResponse = apiResponse.map((model) => model.toEntity());
        return right(entityResponse);
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }
}
