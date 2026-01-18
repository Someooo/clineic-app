import '../../domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required super.id,
    required super.userId,
    required super.appointmentsCount,
    required super.status,
    required super.userName,
    required super.patientName,
    required super.relation,
    required super.userImage,
    required super.userVerify,
    required super.userLocation,
    required super.userType,
    required super.hospital,
    required super.day,
    required super.month,
    required super.appointmentDate,
    required super.appointmentTime,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      appointmentsCount: json['appointments'] ?? 0,
      status: AppointmentStatus.fromString(json['status'] ?? ''),
      userName: json['user_name'] ?? '',
      patientName: json['patient_name'] ?? '',
      relation: json['relation'] ?? '',
      userImage: json['user_image'] ?? '',
      userVerify: (json['user_verify'] ?? 0) == 1,
      userLocation: json['user_location'] ?? '',
      userType: json['user_type'] ?? '',
      hospital: json['hospital'] ?? '',
      day: json['day'] ?? '',
      month: json['month'] ?? '',
      appointmentDate: json['appointment_date'] ?? '',
      appointmentTime: json['appointment_time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'appointments': appointmentsCount,
      'status': status.name,
      'user_name': userName,
      'patient_name': patientName,
      'relation': relation,
      'user_image': userImage,
      'user_verify': userVerify ? 1 : 0,
      'user_location': userLocation,
      'user_type': userType,
      'hospital': hospital,
      'day': day,
      'month': month,
      'appointment_date': appointmentDate,
      'appointment_time': appointmentTime,
    };
  }
}
