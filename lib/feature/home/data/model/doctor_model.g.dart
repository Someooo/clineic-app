// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => _DoctorModel(
  id: (json['id'] as num).toInt(),
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

Map<String, dynamic> _$DoctorModelToJson(_DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'sub_heading': instance.subHeading,
      'avatar': instance.avatar,
      'average_rating': instance.averageRating,
      'total_rating': instance.totalRating,
      'location': instance.location,
      'specialities': instance.specialities,
      'services': instance.services,
      'available_days': instance.availableDays,
      'starting_price': instance.startingPrice,
      'votes': instance.votes,
      'working_time': instance.workingTime,
    };
