import '../../../../global_imports.dart';
import '../entities/doctor_detail_entity.dart';
import '../repository/doctor_detail_repository.dart';

class GetDoctorDetailCase {
  final DoctorDetailRepository repository;

  GetDoctorDetailCase(this.repository);

  Future<Either<Failure, ApiResponse<DoctorDetailEntity>>> call({
    required int doctorId,
    required CancelToken cancelToken,
  }) {
    return repository.getDoctorDetail(
      doctorId: doctorId,
      cancelToken: cancelToken,
    );
  }
}
