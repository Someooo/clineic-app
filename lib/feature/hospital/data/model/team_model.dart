/// Team Model - Data layer representation
class TeamModel {
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
  final String? specialities;
  final String featured;
  final List<String> bookingsDays;
  final String currentDay;
  final String? votes;
  final String startingPrice;

  TeamModel({
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
    this.specialities,
    this.featured = "",
    this.bookingsDays = const [],
    this.currentDay = "",
    this.votes,
    this.startingPrice = "",
  });

  /// Create TeamModel from JSON
  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      name: json['name'] as String? ?? '',
      id: json['ID'] as int? ?? 0, // Note: JSON uses 'ID' (uppercase)
      status: json['status'] as String? ?? '',
      image: json['image'] as String? ?? '',
      averageRating: json['average_rating'] as String?,
      totalRating: json['total_rating'] as String? ?? "0",
      percentage: json['percentage'] as String? ?? "",
      medicalVerified: json['medilcal_verified'] as String? ?? "no", // Note: typo in API
      isVerified: json['is_verified'] as String? ?? "yes",
      subHeading: json['sub_heading'] as String?,
      specialities: _parseSpecialities(json['specialities']),
      featured: json['featured'] as String? ?? "",
      bookingsDays: (json['bookings_days'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ?? [],
      currentDay: json['current_day'] as String? ?? "",
      votes: json['votes'] as String?,
      startingPrice: json['starting_price'] as String? ?? "",
    );
  }

  /// Helper method to parse specialities field that can be either String or Map
  static String? _parseSpecialities(dynamic specialities) {
    if (specialities == null) return null;
    
    if (specialities is String) {
      return specialities.isEmpty ? null : specialities;
    }
    
    if (specialities is Map<String, dynamic>) {
      // If it's a map, extract the name field
      return specialities['name'] as String?;
    }
    
    return null;
  }

  /// Convert TeamModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ID': id,
      'status': status,
      'image': image,
      'average_rating': averageRating,
      'total_rating': totalRating,
      'percentage': percentage,
      'medilcal_verified': medicalVerified,
      'is_verified': isVerified,
      'sub_heading': subHeading,
      'specialities': specialities,
      'featured': featured,
      'bookings_days': bookingsDays,
      'current_day': currentDay,
      'votes': votes,
      'starting_price': startingPrice,
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
