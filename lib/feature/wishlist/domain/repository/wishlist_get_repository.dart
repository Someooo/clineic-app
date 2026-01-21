import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/wishlist_doctor_entity.dart';

abstract class WishlistGetRepository {
  Future<Either<Failure, List<WishlistDoctorEntity>>> getWishlist({
    required int profileId,
    required String type,
  });
}
