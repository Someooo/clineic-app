import 'doctor_hospital_model.dart';
import 'doctor_profile_model.dart';

/// Doctor Detail Model - Data layer representation
class DoctorDetailModel {
  final DoctorProfileModel profile;
  final List<DoctorHospitalModel> hospitals;

  DoctorDetailModel({required this.profile, required this.hospitals});

  factory DoctorDetailModel.fromJson(Map<String, dynamic> json) {
    final profileJson = json['profile'] as Map<String, dynamic>?;
    final hospitalsJson = json['doctor_hospitals'] as List<dynamic>?;

    if (profileJson == null) {
      throw Exception('No profile data returned');
    }

    return DoctorDetailModel(
      profile: DoctorProfileModel.fromJson(profileJson),
      hospitals:
          (hospitalsJson ?? <dynamic>[]).map((item) {
            if (item is Map<String, dynamic>) {
              return DoctorHospitalModel.fromJson(item);
            }
            throw Exception('Invalid hospital data');
          }).toList(),
    );
  }
}
