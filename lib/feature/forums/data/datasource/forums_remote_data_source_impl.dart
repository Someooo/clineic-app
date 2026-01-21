import '../../../../global_imports.dart';
import '../endpoint/forums_endpoint.dart';
import '../model/forum_model.dart';
import '../model/forum_answer_request_model.dart';
import '../model/forum_answer_response_model.dart';
import '../model/forum_answer_model.dart';
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

  @override
  Future<Either<Failure, ForumAnswerResponseModel>> postAnswer({
    required int userId,
    required int forumId,
    required String forumAnswer,
  }) async {
    try {
      final request = ForumAnswerRequestModel(
        user_id: userId,
        forum_id: forumId,
        forum_answer: forumAnswer,
      );
      
      final response = await apiServices.postData(
        ForumsEndpoint.postAnswer,
        request.toJson(),
      );

      return Right(ForumAnswerResponseModel.fromJson(response));
    } catch (e, stackTrace) {
      return handleRepoDataError<ForumAnswerResponseModel>(e, stackTrace);
    }
  }

  @override
  Future<Either<Failure, List<ForumAnswerModel>>> getAnswers({
    required int forumId,
    required int userId,
  }) async {
    try {
      final url = '${ForumsEndpoint.getAnswers}?id=$forumId&user_id=$userId';
      
      final response = await apiServices.getData(url);

      // Check if response is a direct array (like logs show)
      if (response is List) {
        final answers = response.map((json) => ForumAnswerModel.fromJson(json)).toList();
        return Right(answers);
      }
      
      // Check if response has status/data structure
      final status = response['status'] as String?;
      final data = response['data'] as List<dynamic>?;
      final message = response['message'] as String?;

      if (status == 'success' && data != null) {
        final answers = data.map((json) => ForumAnswerModel.fromJson(json)).toList();
        return Right(answers);
      } else if (message == 'No Record' || response['type'] == 'error') {
        // Handle "No Record" as empty answers list
        return Right([]);
      } else {
        return Left(ServerFailure(message: message ?? 'Unknown error'));
      }
    } catch (e, stackTrace) {
      return handleRepoDataError<List<ForumAnswerModel>>(e, stackTrace);
    }
  }
}
