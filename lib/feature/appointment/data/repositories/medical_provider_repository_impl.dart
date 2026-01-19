import 'package:dartz/dartz.dart';
import '../../domain/entities/medical_provider_entity.dart';
import '../../domain/repositories/medical_provider_repository.dart';
import '../datasources/medical_provider_remote_data_source.dart';

class MedicalProviderRepositoryImpl implements MedicalProviderRepository {
  final MedicalProviderRemoteDataSource remoteDataSource;

  MedicalProviderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<MedicalProviderEntity>>> getHospitalDoctorsList() async {
    final result = await remoteDataSource.getHospitalDoctorsList();
    
    return result.fold(
      (error) => Left(error),
      (providers) => Right(providers),
    );
  }
}
