import '../../../../global_imports.dart';
import '../entities/doctor_entity.dart';
import '../../data/model/doctor_model.dart';

extension DoctorModelMapper on DoctorModel {
  DoctorEntity toEntity() => DoctorEntity(
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
        startingPrice: startingPrice,
        votes: votes,
        workingTime: workingTime,
      );
}

extension DoctorEntityMapper on DoctorEntity {
  DoctorModel toModel() => DoctorModel(
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
        startingPrice: startingPrice,
        votes: votes,
        workingTime: workingTime,
      );
}


