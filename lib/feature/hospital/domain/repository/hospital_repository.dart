import '../../../../global_imports.dart';
import '../entities/hospital_entity.dart';

abstract class HospitalRepository {
  Future<Either<Failure, ApiResponse<HospitalEntity>>> getHospitalsList({
    required CancelToken cancelToken,
  });
}
