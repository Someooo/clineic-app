import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/forum_entity.dart';
import '../../domain/usecases/get_forums_listing_usecase.dart';

part 'forums_state.dart';

class ForumsCubit extends Cubit<ForumsState> {
  final GetForumsListingUseCase getForumsListingUseCase;

  ForumsCubit({required this.getForumsListingUseCase}) : super(const ForumsInitial());

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
}
