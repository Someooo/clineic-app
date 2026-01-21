import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/wishlist_entity.dart';

abstract class WishlistRepository {
  Future<Either<Failure, WishlistEntity>> addToWishlist({
    required int userId,
    required int doctorId,
    required String column,
  });
}
