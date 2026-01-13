import '../entities/hospital_entity.dart';
import '../../data/model/hospital_model.dart';

extension HospitalModelMapper on HospitalModel {
  HospitalEntity toEntity() {
    return HospitalEntity(
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
