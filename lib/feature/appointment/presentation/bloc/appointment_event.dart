import 'package:equatable/equatable.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();

  @override
  List<Object> get props => [];
}

class GetAppointmentsEvent extends AppointmentEvent {
  final int userId;
  final String? appointmentDate;
  final String? status;

  const GetAppointmentsEvent({
    required this.userId,
    this.appointmentDate,
    this.status,
  });

  @override
  List<Object> get props => [userId, if (appointmentDate != null) appointmentDate!, if (status != null) status!];
}
