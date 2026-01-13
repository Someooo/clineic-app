/// Hospital Entity - Domain layer representation
class HospitalEntity {
  final int id;
  final String fullName;
  final String? subHeading;
  final String? avatar;
  final String? location;
  final List<String>? availableDays;
  final String? workingTime;
  final int? approvedTeams;

  HospitalEntity({
    required this.id,
    required this.fullName,
    this.subHeading,
    this.avatar,
    this.location,
    this.availableDays,
    this.workingTime,
    this.approvedTeams,
  });
}
