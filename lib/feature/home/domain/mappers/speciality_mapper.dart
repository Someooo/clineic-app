import '../entities/speciality_entity.dart';
import '../../data/model/speciality_model.dart';

extension SpecialityModelMapper on SpecialityModel {
  SpecialityEntity toEntity() => SpecialityEntity(
        id: id,
        name: name,
        slug: slug,
        url: url,
        color: color,
      );
}

extension SpecialityEntityMapper on SpecialityEntity {
  SpecialityModel toModel() => SpecialityModel(
        id: id,
        name: name,
        slug: slug,
        url: url,
        color: color,
      );
}


