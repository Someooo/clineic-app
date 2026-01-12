// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) =>
    _HospitalModel(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String,
      subHeading: json['sub_heading'] as String?,
      avatar: json['avatar'] as String?,
      location: json['location'] as String?,
      availableDays:
          (json['available_days'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      workingTime: json['working_time'] as String?,
      approvedTeams: (json['approvedTeams'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HospitalModelToJson(_HospitalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'sub_heading': instance.subHeading,
      'avatar': instance.avatar,
      'location': instance.location,
      'available_days': instance.availableDays,
      'working_time': instance.workingTime,
      'approvedTeams': instance.approvedTeams,
    };
