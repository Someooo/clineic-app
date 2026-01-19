import 'package:dartz/dartz.dart';
import '../../domain/entities/appointment_entity.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment_remote_data_source.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;

  AppointmentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<AppointmentEntity>>> getAppointments({
    required int userId,
    String? appointmentDate,
    String? status,
  }) async {
    final result = await remoteDataSource.getAppointments(
      userId: userId,
      appointmentDate: appointmentDate,
      status: status,
    );
    
    return result.fold(
      (error) => Left(error),
      (appointments) => Right(appointments),
    );
  }
}
