import '../../../../global_imports.dart';

part 'hospital_model.freezed.dart';
part 'hospital_model.g.dart';

@freezed
abstract class HospitalModel with _$HospitalModel {
  const factory HospitalModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "full_name") required String fullName,
    @JsonKey(name: "sub_heading") String? subHeading,
    @JsonKey(name: "avatar") String? avatar,
    @JsonKey(name: "location") String? location,
    @JsonKey(name: "available_days") List<String>? availableDays,
    @JsonKey(name: "working_time") String? workingTime,
    @JsonKey(name: "approvedTeams") int? approvedTeams,
  }) = _HospitalModel;

  factory HospitalModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalModelFromJson(json);
}

