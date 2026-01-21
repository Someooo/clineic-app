import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/wishlist_entity.dart';
import '../repository/wishlist_repository.dart';

class RemoveFromWishlistUseCase {
  final WishlistRepository repository;

  RemoveFromWishlistUseCase({required this.repository});

  Future<Either<Failure, WishlistEntity>> call({
    required int userId,
    required int doctorId,
    required String column,
  }) {
    return repository.removeFromWishlist(
      userId: userId,
      doctorId: doctorId,
      column: column,
    );
  }
}
