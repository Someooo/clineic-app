import '../../../../global_imports.dart';
import '../entities/hospital_entity.dart';
import '../repository/home_repository.dart';

class GetHospitalsListCase {
  final HomeRepository repository;

  GetHospitalsListCase(this.repository);

  Future<Either<Failure, ApiResponse<HospitalEntity>>> call({
    required CancelToken cancelToken,
  }) {
    return repository.getHospitalsList(
      cancelToken: cancelToken,
    );
  }
}


