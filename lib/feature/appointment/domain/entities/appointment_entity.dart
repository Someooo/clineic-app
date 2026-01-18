import 'package:equatable/equatable.dart';

enum AppointmentStatus {
  pending,
  inProgress,
  completed,
  cancelled;

  static AppointmentStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return AppointmentStatus.pending;
      case 'in progress':
        return AppointmentStatus.inProgress;
      case 'completed':
        return AppointmentStatus.completed;
      case 'cancelled':
        return AppointmentStatus.cancelled;
      default:
        return AppointmentStatus.pending;
    }
  }

  String get displayName {
    switch (this) {
      case AppointmentStatus.pending:
        return 'Pending';
      case AppointmentStatus.inProgress:
        return 'In Progress';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
    }
  }
}

class AppointmentEntity extends Equatable {
  final int id;
  final int userId;
  final int appointmentsCount;
  final AppointmentStatus status;
  final String userName;
  final String patientName;
  final String relation;
  final String userImage;
  final bool userVerify;
  final String userLocation;
  final String userType;
  final String hospital;
  final String day;
  final String month;
  final String appointmentDate;
  final String appointmentTime;

  const AppointmentEntity({
    required this.id,
    required this.userId,
    required this.appointmentsCount,
    required this.status,
    required this.userName,
    required this.patientName,
    required this.relation,
    required this.userImage,
    required this.userVerify,
    required this.userLocation,
    required this.userType,
    required this.hospital,
    required this.day,
    required this.month,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        appointmentsCount,
        status,
        userName,
        patientName,
        relation,
        userImage,
        userVerify,
        userLocation,
        userType,
        hospital,
        day,
        month,
        appointmentDate,
        appointmentTime,
      ];
}
