// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpecialityModel _$SpecialityModelFromJson(Map<String, dynamic> json) =>
    _SpecialityModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      url: json['url'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$SpecialityModelToJson(_SpecialityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'url': instance.url,
      'color': instance.color,
    };
