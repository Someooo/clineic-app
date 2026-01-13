import '../../../../global_imports.dart';
import '../entities/doctor_detail_entity.dart';

abstract class DoctorDetailRepository {
  Future<Either<Failure, ApiResponse<DoctorDetailEntity>>> getDoctorDetail({
    required int doctorId,
    required CancelToken cancelToken,
  });
}
