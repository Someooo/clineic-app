/// Doctor Hospital Entity - Domain layer representation
class DoctorHospitalEntity {
  final int id;
  final String fullName;
  final String? subHeading;
  final String? avatar;
  final String? location;
  final List<String> availableDays;
  final String? workingTime;
  final int? approvedTeams;

  DoctorHospitalEntity({
    required this.id,
    required this.fullName,
    this.subHeading,
    this.avatar,
    this.location,
    this.availableDays = const [],
    this.workingTime,
    this.approvedTeams,
  });
}
