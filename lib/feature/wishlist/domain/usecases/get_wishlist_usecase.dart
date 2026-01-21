import 'package:dartz/dartz.dart';
import '../../../../global_imports.dart';
import '../entities/wishlist_doctor_entity.dart';
import '../repository/wishlist_get_repository.dart';

class GetWishlistUseCase {
  final WishlistGetRepository repository;

  GetWishlistUseCase({required this.repository});

  Future<Either<Failure, List<WishlistDoctorEntity>>> call({
    required int profileId,
    required String type,
  }) {
    logger.i('UseCase called with profileId: $profileId, type: $type');
    return repository.getWishlist(profileId: profileId, type: type);
  }
}
