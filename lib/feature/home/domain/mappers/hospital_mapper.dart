import '../entities/hospital_entity.dart';
import '../../data/model/hospital_model.dart';

extension HospitalModelMapper on HospitalModel {
  HospitalEntity toEntity() => HospitalEntity(
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

extension HospitalEntityMapper on HospitalEntity {
  HospitalModel toModel() => HospitalModel(
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

