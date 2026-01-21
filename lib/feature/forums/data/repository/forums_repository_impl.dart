import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/forum_entity.dart';
import '../../domain/repository/forums_repository.dart';
import '../datasource/forums_remote_data_source.dart';
import '../model/forum_model.dart';
import '../model/forum_answer_model.dart';

class ForumsRepositoryImpl implements ForumsRepository {
  final ForumsRemoteDataSource remoteDataSource;

  ForumsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ForumEntity>>> getForumsListing({
    required int pageNumber,
    required int showUsers,
    required String orderBy,
    required String search,
    required String specialities,
  }) async {
    final result = await remoteDataSource.getForumsListing(
      pageNumber: pageNumber,
      showUsers: showUsers,
      orderBy: orderBy,
      search: search,
      specialities: specialities,
    );

    return result.fold(
      (failure) => Left(failure),
      (forumModels) {
        final forumEntities = forumModels.map(_mapToEntity).toList();
        return Right(forumEntities);
      },
    );
  }

  @override
  Future<Either<Failure, String>> postAnswer({
    required int userId,
    required int forumId,
    required String forumAnswer,
  }) async {
    final result = await remoteDataSource.postAnswer(
      userId: userId,
      forumId: forumId,
      forumAnswer: forumAnswer,
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.message),
    );
  }

  @override
  Future<Either<Failure, List<ForumAnswerModel>>> getAnswers({
    required int forumId,
    required int userId,
  }) async {
    final result = await remoteDataSource.getAnswers(
      forumId: forumId,
      userId: userId,
    );

    return result.fold(
      (failure) => Left(failure),
      (answers) => Right(answers),
    );
  }

  ForumEntity _mapToEntity(ForumModel model) {
    return ForumEntity(
      image: model.image,
      title: model.title,
      content: model.content,
      id: model.id,
      postDate: model.postDate,
      answers: model.answers,
      count: model.count,
    );
  }
}
