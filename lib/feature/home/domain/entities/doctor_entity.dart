import '../../../../global_imports.dart';

part 'doctor_entity.freezed.dart';

@freezed
abstract class DoctorEntity with _$DoctorEntity {
  const factory DoctorEntity({
    required int id,
    required String fullName,
    String? subHeading,
    String? avatar,
    String? averageRating,
    int? totalRating,
    dynamic location,
    List<dynamic>? specialities,
    List<dynamic>? services,
    String? availableDays,
    dynamic startingPrice,
    int? votes,
    dynamic workingTime,
  }) = _DoctorEntity;
}
