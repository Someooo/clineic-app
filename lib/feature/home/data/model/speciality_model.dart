import '../../../../global_imports.dart';

part 'speciality_model.freezed.dart';
part 'speciality_model.g.dart';

@freezed
abstract class SpecialityModel with _$SpecialityModel {
  const factory SpecialityModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "slug") required String slug,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "color") String? color,
  }) = _SpecialityModel;

  factory SpecialityModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialityModelFromJson(json);
}


