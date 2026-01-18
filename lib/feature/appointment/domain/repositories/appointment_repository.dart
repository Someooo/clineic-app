import 'package:dartz/dartz.dart';
import '../entities/appointment_entity.dart';

abstract class AppointmentRepository {
  Future<Either<String, List<AppointmentEntity>>> getAppointments({
    required int userId,
    required String appointmentDate,
  });
}
