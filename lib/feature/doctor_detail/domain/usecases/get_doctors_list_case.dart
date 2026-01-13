import '../../../../global_imports.dart';
import '../entities/doctor_list_entity.dart';
import '../repository/doctor_detail_repository.dart';

class GetDoctorsListCase {
  final DoctorDetailRepository repository;

  GetDoctorsListCase(this.repository);

  Future<Either<Failure, ApiResponse<DoctorListEntity>>> call({
    required CancelToken cancelToken,
  }) {
    return repository.getDoctorsList(cancelToken: cancelToken);
  }
}
