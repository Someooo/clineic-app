/// Wishlist Doctor Entity - Domain layer representation for wishlist doctor
class WishlistDoctorEntity {
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

  WishlistDoctorEntity({
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
}
