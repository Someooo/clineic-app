import '../../../../global_imports.dart';

part 'hospital_entity.freezed.dart';

@freezed
abstract class HospitalEntity with _$HospitalEntity {
  const factory HospitalEntity({
    required int id,
    required String fullName,
    String? subHeading,
    String? avatar,
    String? location,
    List<String>? availableDays,
    String? workingTime,
    int? approvedTeams,
  }) = _HospitalEntity;
}

