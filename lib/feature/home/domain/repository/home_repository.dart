import '../../../../global_imports.dart';
import '../entities/doctor_entity.dart';
import '../entities/hospital_entity.dart';
import '../entities/speciality_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, ApiResponse<DoctorEntity>>> getDoctorsList({
    required CancelToken cancelToken,
  });
  
  Future<Either<Failure, ApiResponse<HospitalEntity>>> getHospitalsList({
    required CancelToken cancelToken,
  });
  
  Future<Either<Failure, ApiResponse<SpecialityEntity>>> getSpecialitiesList({
    required CancelToken cancelToken,
  });
}
