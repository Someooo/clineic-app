import 'package:dartz/dartz.dart';
import '../entities/medical_provider_entity.dart';
import '../repositories/medical_provider_repository.dart';

class GetHospitalDoctorsUseCase {
  final MedicalProviderRepository repository;

  GetHospitalDoctorsUseCase({required this.repository});

  Future<Either<String, List<MedicalProviderEntity>>> call() async {
    return await repository.getHospitalDoctorsList();
  }
}
