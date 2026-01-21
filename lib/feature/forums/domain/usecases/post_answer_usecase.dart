import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repository/forums_repository.dart';

class PostAnswerUseCase {
  final ForumsRepository repository;

  PostAnswerUseCase({required this.repository});

  Future<Either<Failure, String>> call({
    required int userId,
    required int forumId,
    required String forumAnswer,
  }) {
    return repository.postAnswer(
      userId: userId,
      forumId: forumId,
      forumAnswer: forumAnswer,
    );
  }
}
