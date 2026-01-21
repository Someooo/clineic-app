import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/forum_entity.dart';
import '../../domain/usecases/get_forums_listing_usecase.dart';
import '../../domain/usecases/post_answer_usecase.dart';
import '../../domain/usecases/get_answers_usecase.dart';
import '../../data/model/forum_answer_model.dart';

part 'forums_state.dart';

class ForumsCubit extends Cubit<ForumsState> {
  final GetForumsListingUseCase getForumsListingUseCase;
  final PostAnswerUseCase postAnswerUseCase;
  final GetAnswersUseCase getAnswersUseCase;

  ForumsCubit({
    required this.getForumsListingUseCase,
    required this.postAnswerUseCase,
    required this.getAnswersUseCase,
  }) : super(const ForumsInitial());

  Future<void> loadForums() async {
    emit(const ForumsLoading());
    
    final result = await getForumsListingUseCase.call(
      pageNumber: 1,
      showUsers: 10,
      orderBy: 'date',
      search: '',
      specialities: '',
    );

    result.fold(
      (failure) => emit(ForumsError(message: failure.message)),
      (forums) => emit(ForumsLoaded(forums: forums)),
    );
  }

  Future<void> refreshForums() async {
    emit(const ForumsLoading());
    
    final result = await getForumsListingUseCase.call(
      pageNumber: 1,
      showUsers: 10,
      orderBy: 'date',
      search: '',
      specialities: '',
    );

    result.fold(
      (failure) => emit(ForumsError(message: failure.message)),
      (forums) => emit(ForumsLoaded(forums: forums)),
    );
  }

  Future<void> postAnswer({
    required int userId,
    required int forumId,
    required String forumAnswer,
  }) async {
    emit(const ForumsLoading());
    
    final result = await postAnswerUseCase.call(
      userId: userId,
      forumId: forumId,
      forumAnswer: forumAnswer,
    );

    result.fold(
      (failure) => emit(ForumsError(message: failure.message)),
      (message) => emit(ForumsAnswerPosted(message: message)),
    );
  }

  Future<void> getAnswers({
    required int forumId,
    required int userId,
  }) async {
    emit(const ForumsLoading());
    
    final result = await getAnswersUseCase.call(
      forumId: forumId,
      userId: userId,
    );

    result.fold(
      (failure) => emit(ForumsError(message: failure.message)),
      (answers) => emit(ForumsAnswersLoaded(answers: answers)),
    );
  }
}
