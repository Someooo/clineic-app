import 'doctor_hospital_entity.dart';
import 'doctor_profile_entity.dart';

/// Doctor Detail Entity - Domain layer representation
class DoctorDetailEntity {
  final DoctorProfileEntity profile;
  final List<DoctorHospitalEntity> hospitals;

  DoctorDetailEntity({required this.profile, required this.hospitals});
}
