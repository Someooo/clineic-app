import 'package:equatable/equatable.dart';

class MedicalProviderEntity extends Equatable {
  final int id;
  final String fullName;
  final String subHeading;
  final String avatar;
  final String location;
  final List<String> availableDays;
  final String? workingTime;
  final int approvedTeams;
  final bool isHospital;

  const MedicalProviderEntity({
    required this.id,
    required this.fullName,
    required this.subHeading,
    required this.avatar,
    required this.location,
    required this.availableDays,
    this.workingTime,
    required this.approvedTeams,
    required this.isHospital,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        subHeading,
        avatar,
        location,
        availableDays,
        workingTime,
        approvedTeams,
        isHospital,
      ];
}
