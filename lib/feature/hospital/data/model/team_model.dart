/// Team Model - Data layer representation
class TeamModel {
  final String name;
  final int id;
  final String status;
  final String image;

  TeamModel({
    required this.name,
    required this.id,
    required this.status,
    required this.image,
  });

  /// Create TeamModel from JSON
  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      name: json['name'] as String? ?? '',
      id: json['ID'] as int? ?? 0, // Note: JSON uses 'ID' (uppercase)
      status: json['status'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  /// Convert TeamModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ID': id,
      'status': status,
      'image': image,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamModel &&
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
    return 'TeamModel(name: $name, id: $id, status: $status, image: $image)';
  }
}
