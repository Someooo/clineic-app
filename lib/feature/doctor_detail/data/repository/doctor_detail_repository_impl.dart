import '../../../../global_imports.dart';
import '../../domain/entities/doctor_detail_entity.dart';
import '../../domain/repository/doctor_detail_repository.dart';
import '../../domain/mappers/doctor_detail_mapper.dart';
import '../datasource/doctor_detail_remote_data_source.dart';

class DoctorDetailRepositoryImpl implements DoctorDetailRepository {
  final DoctorDetailRemoteDataSource remote;
  final NetworkInfo networkInfo;

  DoctorDetailRepositoryImpl({required this.remote, required this.networkInfo});

  @override
  Future<Either<Failure, ApiResponse<DoctorDetailEntity>>> getDoctorDetail({
    required int doctorId,
    required CancelToken cancelToken,
  }) async {
    try {
      final hasConnection = await networkInfo.isConnected;

      if (!hasConnection) {
        return left(ServerFailure(message: 'No internet connection'));
      }

      final apiResponse = await remote.getDoctorDetail(
        doctorId: doctorId,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError && apiResponse.data != null) {
        final entityResponse = apiResponse.data!.toEntity();
        return right(
          ApiResponse<DoctorDetailEntity>(
            hasError: false,
            description: apiResponse.description,
            code: apiResponse.code,
            data: entityResponse,
          ),
        );
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }
}
