import '../../../../global_imports.dart';
import '../../domain/usecases/get_home_data_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with CubitLifecycleMixin<HomeState> {
  final GetHomeDataCase _getHomeDataCase;

  HomeCubit({
    required GetHomeDataCase getHomeDataCase,
  })  : _getHomeDataCase = getHomeDataCase,
        super(HomeState.initial);

  // TODO: Implement cubit methods
  // Example:
  // Future<void> getHomeData() async {
  //   safeEmit(HomeState.loading());
  //   final result = await _getHomeDataCase(cancelToken: cancelToken);
  //   if (isClosed) return;
  //   result.fold(
  //     (failure) => safeEmit(HomeState.error(message: failure.message)),
  //     (response) {
  //       if (response.data != null) {
  //         safeEmit(HomeState.loaded(response.data!, response.description));
  //       } else {
  //         safeEmit(HomeState.error(message: response.description));
  //       }
  //     },
  //   );
  // }
}
