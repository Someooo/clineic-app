/// Doctor Profile Model - Data layer representation
class DoctorProfileModel {
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

  DoctorProfileModel({
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

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorProfileModel(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      subHeading: json['sub_heading'] as String?,
      avatar: json['avatar'] as String?,
      averageRating: json['average_rating'] as String?,
      totalRating: (json['total_rating'] as num?)?.toInt(),
      location: json['location'] as String?,
      specialities: _toStringList(json['specialities']),
      services: _parseServices(json['services']),
      availableDays: _parseAvailableDays(json['available_days']),
      workingTime: json['working_time'] as String?,
      votes: (json['votes'] as num?)?.toInt(),
    );
  }

  static List<String> _parseServices(dynamic value) {
    if (value is List) {
      return value
          .map((item) {
            if (item is Map<String, dynamic>) {
              return item['title'] as String? ?? '';
            }
            if (item is String) {
              return item.trim();
            }
            return '';
          })
          .where((title) => title.isNotEmpty)
          .toList();
    }
    return [];
  }

  static List<String> _toStringList(dynamic value) {
    if (value is List) {
      return value
          .whereType<String>()
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }
    if (value is String) {
      return value
          .split(',')
          .map((item) => item.trim())
          .where((item) => item.isNotEmpty)
          .toList();
    }
    return [];
  }

  static List<String> _parseAvailableDays(dynamic value) {
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
    return [];
  }
}
