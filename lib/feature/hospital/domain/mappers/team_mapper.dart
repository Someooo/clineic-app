import '../../data/model/team_model.dart';
import '../entities/team_entity.dart';

extension TeamModelMapper on TeamModel {
  TeamEntity toEntity() {
    return TeamEntity(
      name: name,
      id: id,
      status: status,
      image: image,
      averageRating: averageRating,
      totalRating: totalRating,
      percentage: percentage,
      medicalVerified: medicalVerified,
      isVerified: isVerified,
      subHeading: subHeading,
      specialities: specialities ?? "",
      featured: featured,
      bookingsDays: bookingsDays,
      currentDay: currentDay,
      votes: votes,
      startingPrice: startingPrice,
    );
  }
}

extension TeamEntityMapper on TeamEntity {
  TeamModel toModel() {
    return TeamModel(
      name: name,
      id: id,
      status: status,
      image: image,
      averageRating: averageRating,
      totalRating: totalRating,
      percentage: percentage,
      medicalVerified: medicalVerified,
      isVerified: isVerified,
      subHeading: subHeading,
      specialities: specialities.isEmpty ? null : specialities,
      featured: featured,
      bookingsDays: bookingsDays,
      currentDay: currentDay,
      votes: votes,
      startingPrice: startingPrice,
    );
  }
}
