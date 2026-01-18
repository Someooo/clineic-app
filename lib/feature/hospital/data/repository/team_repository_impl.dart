import '../../../../global_imports.dart';
import '../../domain/entities/team_entity.dart';
import '../../domain/repository/team_repository.dart';
import '../../domain/mappers/team_mapper.dart';
import '../datasource/team_remote_data_source.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamRemoteDataSource remote;
  final NetworkInfo networkInfo;

  TeamRepositoryImpl({required this.remote, required this.networkInfo});

  @override
  Future<Either<Failure, ApiResponse<TeamEntity>>> getHospitalTeamList({
    required int profileId,
    required int pageNumber,
    required int showUsers,
    required CancelToken cancelToken,
  }) async {
    try {
      final hasConnection = await networkInfo.isConnected;

      if (!hasConnection) {
        return left(ServerFailure(message: 'No internet connection'));
      }

      final apiResponse = await remote.getHospitalTeamList(
        profileId: profileId,
        pageNumber: pageNumber,
        showUsers: showUsers,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError && apiResponse.list != null) {
        final entityResponse = apiResponse.map((model) => model.toEntity());
        return right(entityResponse);
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
