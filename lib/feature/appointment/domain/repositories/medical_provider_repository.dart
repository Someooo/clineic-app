import 'package:dartz/dartz.dart';
import '../entities/medical_provider_entity.dart';

abstract class MedicalProviderRepository {
  Future<Either<String, List<MedicalProviderEntity>>> getHospitalDoctorsList();
}
