import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/forum_model.dart';
import '../model/forum_answer_response_model.dart';

abstract class ForumsRemoteDataSource {
  Future<Either<Failure, List<ForumModel>>> getForumsListing({
    required int pageNumber,
    required int showUsers,
    required String orderBy,
    required String search,
    required String specialities,
  });

  Future<Either<Failure, ForumAnswerResponseModel>> postAnswer({
    required int userId,
    required int forumId,
    required String forumAnswer,
  });
}
