import '../../domain/entities/wishlist_doctor_entity.dart';

/// Wishlist Model - Data layer representation
class WishlistModel {
  final int id;
  final String image;
  final String link;
  final String name;
  final String medilcalVerified;
  final String isVerified;
  final String? subheading;
  final String totalRating;
  final List<dynamic>? specialities;
  final String averageRating;

  WishlistModel({
    required this.id,
    required this.image,
    required this.link,
    required this.name,
    required this.medilcalVerified,
    required this.isVerified,
    this.subheading,
    required this.totalRating,
    this.specialities,
    required this.averageRating,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['id'] as int,
      image: json['image'] as String,
      link: json['link'] as String,
      name: json['name'] as String,
      medilcalVerified: json['medilcal_verified'] as String,
      isVerified: json['is_verified'] as String,
      subheading: json['subheading'] as String?,
      totalRating: json['total_rating'] as String,
      specialities: _handleSpecialities(json['specialities']),
      averageRating: json['average_rating'] as String,
    );
  }

  static List<dynamic>? _handleSpecialities(dynamic specialities) {
    if (specialities == null) return null;
    
    // If it's already a list, return as is
    if (specialities is List) return specialities;
    
    // If it's a single object (Map), wrap it in a list
    if (specialities is Map) return [specialities];
    
    // For any other type, return empty list
    return [];
  }

  WishlistDoctorEntity toEntity() {
    return WishlistDoctorEntity(
      id: id,
      image: image,
      link: link,
      name: name,
      medilcalVerified: medilcalVerified,
      isVerified: isVerified,
      subheading: subheading,
      totalRating: totalRating,
      specialities: specialities,
      averageRating: averageRating,
    );
  }
}
