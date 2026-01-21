import 'package:dartz/dartz.dart';
import '../../../../global_imports.dart';
import '../datasource/wishlist_get_remote_datasource.dart';
import '../../domain/entities/wishlist_doctor_entity.dart';
import '../../domain/repository/wishlist_get_repository.dart';

class WishlistGetRepositoryImpl implements WishlistGetRepository {
  final WishlistGetRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WishlistGetRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<WishlistDoctorEntity>>> getWishlist({
    required int profileId,
    required String type,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        logger.i('Getting wishlist with profileId: $profileId, type: $type');
        final models = await remoteDataSource.getWishlist(profileId, type);
        final entities = models.map((model) => model.toEntity()).toList();
        logger.i('Successfully converted ${entities.length} models to entities');
        return Right(entities);
      } catch (e) {
        logger.e('Repository error: $e');
        return Left(ServerFailure(message: 'Failed to get wishlist: $e'));
      }
    } else {
      logger.e('No internet connection');
      return Left(ServerFailure(message: 'No internet connection'));
    }
  }
}
