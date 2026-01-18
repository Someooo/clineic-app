/// Team Entity - Domain layer representation
class TeamEntity {
  final String name;
  final int id;
  final String status;
  final String image;

  TeamEntity({
    required this.name,
    required this.id,
    required this.status,
    required this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamEntity &&
        other.name == name &&
        other.id == id &&
        other.status == status &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        status.hashCode ^
        image.hashCode;
  }

  @override
  String toString() {
    return 'TeamEntity(name: $name, id: $id, status: $status, image: $image)';
  }
}
