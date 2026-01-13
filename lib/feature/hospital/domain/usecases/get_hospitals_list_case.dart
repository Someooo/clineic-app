import '../../../../global_imports.dart';
import '../entities/hospital_entity.dart';
import '../repository/hospital_repository.dart';

class GetHospitalsListCase {
  final HospitalRepository repository;

  GetHospitalsListCase(this.repository);

  Future<Either<Failure, ApiResponse<HospitalEntity>>> call({
    required CancelToken cancelToken,
  }) {
    return repository.getHospitalsList(cancelToken: cancelToken);
  }
}
