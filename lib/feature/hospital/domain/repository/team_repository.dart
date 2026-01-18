import '../../../../global_imports.dart';
import '../entities/team_entity.dart';

abstract class TeamRepository {
  Future<Either<Failure, ApiResponse<TeamEntity>>> getHospitalTeamList({
    required int userId,
    required String status,
    required int pageNumber,
    required int showUsers,
    required CancelToken cancelToken,
  });
}
