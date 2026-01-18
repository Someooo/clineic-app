/// Team Entity - Domain layer representation
class TeamEntity {
  final String name;
  final int id;
  final String status;
  final String image;
  final String? averageRating;
  final String totalRating;
  final String percentage;
  final String medicalVerified;
  final String isVerified;
  final String? subHeading;
  final String specialities;
  final String featured;
  final List<String> bookingsDays;
  final String currentDay;
  final String? votes;
  final String startingPrice;

  TeamEntity({
    required this.name,
    required this.id,
    required this.status,
    required this.image,
    this.averageRating,
    this.totalRating = "0",
    this.percentage = "",
    this.medicalVerified = "no",
    this.isVerified = "yes",
    this.subHeading,
    this.specialities = "",
    this.featured = "",
    this.bookingsDays = const [],
    this.currentDay = "",
    this.votes,
    this.startingPrice = "",
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
