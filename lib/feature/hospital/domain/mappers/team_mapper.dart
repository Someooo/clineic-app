import '../../data/model/team_model.dart';
import '../entities/team_entity.dart';

extension TeamModelMapper on TeamModel {
  TeamEntity toEntity() {
    return TeamEntity(
      name: name,
      id: id,
      status: status,
      image: image,
    );
  }
}

extension TeamEntityMapper on TeamEntity {
  TeamModel toModel() {
    return TeamModel(
      name: name,
      id: id,
      status: status,
      image: image,
    );
  }
}
