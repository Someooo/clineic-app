import '../../../../global_imports.dart';
import '../entities/doctor_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, ApiResponse<DoctorEntity>>> getDoctorsList({
    required CancelToken cancelToken,
  });
}
