/// Doctor List Entity - Domain layer representation for doctor list
class DoctorListEntity {
  final int id;
  final String fullName;
  final String? subHeading;
  final String? avatar;
  final String? averageRating;
  final int? totalRating;
  final dynamic location;
  final List<dynamic>? specialities;
  final List<dynamic>? services;
  final String? availableDays;
  final dynamic startingPrice;
  final int? votes;
  final dynamic workingTime;

  DoctorListEntity({
    required this.id,
    required this.fullName,
    this.subHeading,
    this.avatar,
    this.averageRating,
    this.totalRating,
    this.location,
    this.specialities,
    this.services,
    this.availableDays,
    this.startingPrice,
    this.votes,
    this.workingTime,
  });
}
