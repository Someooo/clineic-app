import '../../domain/entities/doctor_list_entity.dart';

/// Doctor List Model - Data layer representation
class DoctorListModel {
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

  DoctorListModel({
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

  factory DoctorListModel.fromJson(Map<String, dynamic> json) {
    return DoctorListModel(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      subHeading: json['sub_heading'] as String?,
      avatar: json['avatar'] as String?,
      averageRating: json['average_rating'] as String?,
      totalRating: (json['total_rating'] as num?)?.toInt(),
      location: json['location'],
      specialities: json['specialities'] as List<dynamic>?,
      services: json['services'] as List<dynamic>?,
      availableDays: json['available_days'] as String?,
      startingPrice: json['starting_price'],
      votes: (json['votes'] as num?)?.toInt(),
      workingTime: json['working_time'],
    );
  }

  DoctorListEntity toEntity() {
    return DoctorListEntity(
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
}
