import 'package:equatable/equatable.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();

  @override
  List<Object> get props => [];
}

class GetAppointmentsEvent extends AppointmentEvent {
  final int userId;
  final String appointmentDate;

  const GetAppointmentsEvent({
    required this.userId,
    required this.appointmentDate,
  });

  @override
  List<Object> get props => [userId, appointmentDate];
}
