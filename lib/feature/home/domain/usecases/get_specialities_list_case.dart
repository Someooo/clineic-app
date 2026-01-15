import '../../../../global_imports.dart';
import '../entities/speciality_entity.dart';
import '../repository/home_repository.dart';

class GetSpecialitiesListCase {
  final HomeRepository repository;

  GetSpecialitiesListCase(this.repository);

  Future<Either<Failure, ApiResponse<SpecialityEntity>>> call({
    required CancelToken cancelToken,
  }) {
    return repository.getSpecialitiesList(
      cancelToken: cancelToken,
    );
  }
}


