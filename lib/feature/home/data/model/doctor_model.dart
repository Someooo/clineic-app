import '../../../../global_imports.dart';

part 'doctor_model.freezed.dart';
part 'doctor_model.g.dart';

@freezed
abstract class DoctorModel with _$DoctorModel {
  const factory DoctorModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "full_name") required String fullName,
    @JsonKey(name: "sub_heading") String? subHeading,
    @JsonKey(name: "avatar") String? avatar,
    @JsonKey(name: "average_rating") String? averageRating,
    @JsonKey(name: "total_rating") int? totalRating,
    @JsonKey(name: "location") dynamic location,
    @JsonKey(name: "specialities") List<dynamic>? specialities,
    @JsonKey(name: "services") List<dynamic>? services,
    @JsonKey(name: "available_days") String? availableDays,
    @JsonKey(name: "starting_price") dynamic startingPrice,
    @JsonKey(name: "votes") int? votes,
    @JsonKey(name: "working_time") dynamic workingTime,
  }) = _DoctorModel;

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
}
