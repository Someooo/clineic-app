import '../entities/doctor_detail_entity.dart';
import '../entities/doctor_hospital_entity.dart';
import '../entities/doctor_profile_entity.dart';
import '../../data/model/doctor_detail_model.dart';
import '../../data/model/doctor_hospital_model.dart';
import '../../data/model/doctor_profile_model.dart';

extension DoctorProfileModelMapper on DoctorProfileModel {
  DoctorProfileEntity toEntity() {
    return DoctorProfileEntity(
      id: id,
      fullName: fullName,
      subHeading: subHeading,
      avatar: avatar,
      averageRating: averageRating,
      totalRating: totalRating,
      location: location,
      specialities: specialities,
      services: services,
      availableDays: availableDays,
      workingTime: workingTime,
      votes: votes,
    );
  }
}

extension DoctorHospitalModelMapper on DoctorHospitalModel {
  DoctorHospitalEntity toEntity() {
    return DoctorHospitalEntity(
      id: id,
      fullName: fullName,
      subHeading: subHeading,
      avatar: avatar,
      location: location,
      availableDays: availableDays,
      workingTime: workingTime,
      approvedTeams: approvedTeams,
    );
  }
}

extension DoctorDetailModelMapper on DoctorDetailModel {
  DoctorDetailEntity toEntity() {
    return DoctorDetailEntity(
      profile: profile.toEntity(),
      hospitals: hospitals.map((h) => h.toEntity()).toList(),
    );
  }
}
