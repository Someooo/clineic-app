import '../../../../global_imports.dart';
import '../endpoint/forums_endpoint.dart';
import '../model/forum_model.dart';
import 'forums_remote_data_source.dart';

class ForumsRemoteDataSourceImpl implements ForumsRemoteDataSource {
  final ApiServices apiServices;

  ForumsRemoteDataSourceImpl(this.apiServices);

  @override
  Future<Either<Failure, List<ForumModel>>> getForumsListing({
    required int pageNumber,
    required int showUsers,
    required String orderBy,
    required String search,
    required String specialities,
  }) async {
    try {
      final response = await apiServices.getData(
        ForumsEndpoint.getForumsListing(
          pageNumber: pageNumber,
          showUsers: showUsers,
          orderBy: orderBy,
          search: search,
          specialities: specialities,
        ),
      );

      // Check if response is a direct array (like the logs show)
      if (response is List) {
        final forums = response.map((json) => ForumModel.fromJson(json)).toList();
        return Right(forums);
      }
      
      // Check if response has status/data structure
      final status = response['status'] as String?;
      final data = response['data'] as List<dynamic>?;

      if (status == 'success' && data != null) {
        final forums = data.map((json) => ForumModel.fromJson(json)).toList();
        return Right(forums);
      } else {
        return Left(ServerFailure(message: response['message'] as String? ?? 'Unknown error'));
      }
    } catch (e, stackTrace) {
      return handleRepoDataError<List<ForumModel>>(e, stackTrace);
    }
  }
}
