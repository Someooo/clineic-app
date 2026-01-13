/// Doctor Profile Entity - Domain layer representation
class DoctorProfileEntity {
  final int id;
  final String fullName;
  final String? subHeading;
  final String? avatar;
  final String? averageRating;
  final int? totalRating;
  final String? location;
  final List<String> specialities;
  final List<String> services;
  final List<String> availableDays;
  final String? workingTime;
  final int? votes;

  DoctorProfileEntity({
    required this.id,
    required this.fullName,
    this.subHeading,
    this.avatar,
    this.averageRating,
    this.totalRating,
    this.location,
    this.specialities = const [],
    this.services = const [],
    this.availableDays = const [],
    this.workingTime,
    this.votes,
  });
}
