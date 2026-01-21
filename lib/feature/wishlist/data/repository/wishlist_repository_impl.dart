import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/dio_exception.dart';
import '../../../../core/network/network_info.dart';
import '../datasource/wishlist_remote_datasource.dart';
import '../model/wishlist_request_model.dart';
import '../../domain/entities/wishlist_entity.dart';
import '../../domain/repository/wishlist_repository.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WishlistRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, WishlistEntity>> addToWishlist({
    required int userId,
    required int doctorId,
    required String column,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final request = WishlistRequestModel(
          user_id: userId,
          id: doctorId,
          column: column,
        );
        
        final response = await remoteDataSource.addToWishlist(request);
        
        final entity = WishlistEntity(
          authentication: response.authentication,
          type: response.type,
          message: response.message,
        );
        
        
        return Right(entity);
      } catch (e) {
        return Left(ServerFailure(message: 'Failed to add to wishlist: $e'));
      }
    } else {
      return Left(ServerFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, WishlistEntity>> removeFromWishlist({
    required int userId,
    required int doctorId,
    required String column,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final request = WishlistRequestModel(
          user_id: userId,
          id: doctorId,
          column: column,
        );
        
        final response = await remoteDataSource.removeFromWishlist(request);
        
        final entity = WishlistEntity(
          authentication: response.authentication,
          type: response.type,
          message: response.message,
        );
        
        return Right(entity);
      } catch (e) {
        return Left(ServerFailure(message: 'Failed to remove from wishlist: $e'));
      }
    } else {
      return Left(ServerFailure(message: 'No internet connection'));
    }
  }
}
