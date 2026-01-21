import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repository/forums_repository.dart';
import '../../data/model/forum_answer_model.dart';

class GetAnswersUseCase {
  final ForumsRepository repository;

  GetAnswersUseCase({required this.repository});

  Future<Either<Failure, List<ForumAnswerModel>>> call({
    required int forumId,
    required int userId,
  }) {
    return repository.getAnswers(
      forumId: forumId,
      userId: userId,
    );
  }
}
