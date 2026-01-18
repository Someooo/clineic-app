import '../../../../global_imports.dart';
import '../entities/team_entity.dart';
import '../repository/team_repository.dart';

class GetTeamListCase {
  final TeamRepository repository;

  GetTeamListCase(this.repository);

  Future<Either<Failure, ApiResponse<TeamEntity>>> call({
    required int profileId,
    required int pageNumber,
    required int showUsers,
    required CancelToken cancelToken,
  }) {
    return repository.getHospitalTeamList(
      profileId: profileId,
      pageNumber: pageNumber,
      showUsers: showUsers,
      cancelToken: cancelToken,
    );
  }
}
