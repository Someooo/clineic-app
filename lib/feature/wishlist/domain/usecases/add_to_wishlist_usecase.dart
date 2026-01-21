import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/wishlist_entity.dart';
import '../repository/wishlist_repository.dart';

class AddToWishlistUseCase {
  final WishlistRepository repository;

  AddToWishlistUseCase({required this.repository});

  Future<Either<Failure, WishlistEntity>> call({
    required int userId,
    required int doctorId,
    required String column,
  }) {
    return repository.addToWishlist(
      userId: userId,
      doctorId: doctorId,
      column: column,
    );
  }
}
