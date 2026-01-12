import '../../../../global_imports.dart';

part 'speciality_entity.freezed.dart';

@freezed
abstract class SpecialityEntity with _$SpecialityEntity {
  const factory SpecialityEntity({
    required int id,
    required String name,
    required String slug,
    String? url,
    String? color,
  }) = _SpecialityEntity;
}

