import '../../../../global_imports.dart';
import '../entities/doctor_entity.dart';
import '../repository/home_repository.dart';

class GetDoctorsListCase {
  final HomeRepository repository;

  GetDoctorsListCase(this.repository);

  Future<Either<Failure, ApiResponse<DoctorEntity>>> call({
    required CancelToken cancelToken,
  }) {
    return repository.getDoctorsList(
      cancelToken: cancelToken,
    );
  }
}
