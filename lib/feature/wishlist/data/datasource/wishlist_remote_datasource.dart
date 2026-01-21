import '../../../../global_imports.dart';
import '../model/wishlist_request_model.dart';
import '../model/wishlist_response_model.dart';

abstract class WishlistRemoteDataSource {
  Future<WishlistResponseModel> addToWishlist(WishlistRequestModel request);
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final ApiServices apiServices;

  WishlistRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<WishlistResponseModel> addToWishlist(WishlistRequestModel request) async {
    try {
      final response = await apiServices.postData(
        'https://clinic.code-pro.io/api/user/add_wishlist',
        request.toJson(),
      );

      return WishlistResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
