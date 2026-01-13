import '../../../../global_imports.dart';
import '../../domain/entities/hospital_entity.dart';
import '../../domain/repository/hospital_repository.dart';
import '../../domain/mappers/hospital_mapper.dart';
import '../datasource/hospital_remote_data_source.dart';

class HospitalRepositoryImpl implements HospitalRepository {
  final HospitalRemoteDataSource remote;
  final NetworkInfo networkInfo;

  HospitalRepositoryImpl({required this.remote, required this.networkInfo});

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
