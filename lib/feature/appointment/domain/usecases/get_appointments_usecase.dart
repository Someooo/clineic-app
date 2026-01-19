import 'package:dartz/dartz.dart';
import '../entities/appointment_entity.dart';
import '../repositories/appointment_repository.dart';

class GetAppointmentsUseCase {
  final AppointmentRepository repository;

  GetAppointmentsUseCase({required this.repository});

  Future<Either<String, List<AppointmentEntity>>> call({
    required int userId,
    String? appointmentDate,
    String? status,
  }) async {
    return await repository.getAppointments(
      userId: userId,
      appointmentDate: appointmentDate,
      status: status,
    );
  }
}
