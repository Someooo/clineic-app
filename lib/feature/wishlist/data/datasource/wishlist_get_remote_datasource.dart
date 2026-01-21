import '../../../../global_imports.dart';
import '../model/wishlist_model.dart';

abstract class WishlistGetRemoteDataSource {
  Future<List<WishlistModel>> getWishlist(int profileId, String type);
}

class WishlistGetRemoteDataSourceImpl implements WishlistGetRemoteDataSource {
  final ApiServices apiServices;

  WishlistGetRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<WishlistModel>> getWishlist(int profileId, String type) async {
    try {
      final response = await apiServices.getData(
        '/api/user/get_wishlist',
        queryParameters: {
          'profile_id': profileId,
          'type': type,
        },
      );

      logger.i('Wishlist response type: ${response.runtimeType}');
      logger.i('Wishlist response: $response');

      if (response is List) {
        final models = response
            .map((json) {
              logger.i('Parsing item: $json');
              return WishlistModel.fromJson(json as Map<String, dynamic>);
            })
            .toList();
        logger.i('Successfully parsed ${models.length} wishlist items');
        return models;
      } else {
        logger.e('Invalid response format: expected List, got ${response.runtimeType}');
        throw Exception('Invalid response format: expected List, got ${response.runtimeType}');
      }
    } catch (e) {
      logger.e('Error in wishlist datasource: $e');
      throw Exception('Network error: $e');
    }
  }
}
