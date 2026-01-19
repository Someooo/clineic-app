import '../../domain/entities/medical_provider_entity.dart';

class MedicalProviderModel extends MedicalProviderEntity {
  const MedicalProviderModel({
    required super.id,
    required super.fullName,
    required super.subHeading,
    required super.avatar,
    required super.location,
    required super.availableDays,
    super.workingTime,
    required super.approvedTeams,
    required super.isHospital,
  });

  factory MedicalProviderModel.fromJson(Map<String, dynamic> json) {
    return MedicalProviderModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      subHeading: json['sub_heading'] ?? '',
      avatar: json['avatar'] ?? '',
      location: json['location'] ?? '',
      availableDays: json['available_days'] != null 
          ? json['available_days'] is String 
              ? (json['available_days'] as String).split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList()
              : List<String>.from(json['available_days'] ?? [])
          : [],
      workingTime: json['working_time'],
      approvedTeams: json['approvedTeams'] ?? 0,
      isHospital: json['is_hospital'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'sub_heading': subHeading,
      'avatar': avatar,
      'location': location,
      'available_days': availableDays,
      'working_time': workingTime,
      'approvedTeams': approvedTeams,
      'is_hospital': isHospital,
    };
  }
}
