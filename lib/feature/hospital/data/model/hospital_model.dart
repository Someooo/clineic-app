/// Hospital Model - Data layer representation
class HospitalModel {
  final int id;
  final String fullName;
  final String? subHeading;
  final String? avatar;
  final String? location;
  final List<String>? availableDays;
  final String? workingTime;
  final int? approvedTeams;

  HospitalModel({
    required this.id,
    required this.fullName,
    this.subHeading,
    this.avatar,
    this.location,
    this.availableDays,
    this.workingTime,
    this.approvedTeams,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      subHeading: json['sub_heading'] as String?,
      avatar: json['avatar'] as String?,
      location: json['location'] as String?,
      availableDays: _parseAvailableDays(json['available_days']),
      workingTime: json['working_time'] as String?,
      approvedTeams: (json['approvedTeams'] as num?)?.toInt(),
    );
  }

  static List<String>? _parseAvailableDays(dynamic value) {
    if (value is List) {
      return value.whereType<String>().toList();
    }
    if (value is String) {
      return value
          .split(',')
          .map((item) => item.trim())
          .where((item) => item.isNotEmpty)
          .toList();
    }
    return null;
  }
}
