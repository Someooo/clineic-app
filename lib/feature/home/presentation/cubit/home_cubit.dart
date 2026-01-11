import '../../../../global_imports.dart';
import '../../domain/entities/doctor_entity.dart';
import '../../domain/usecases/get_home_data_case.dart';
import '../../domain/usecases/get_doctors_list_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with CubitLifecycleMixin<HomeState> {
  final GetHomeDataCase _getHomeDataCase;
  final GetDoctorsListCase _getDoctorsListCase;
  CancelToken? _cancelToken;

  HomeCubit({
    required GetHomeDataCase getHomeDataCase,
    required GetDoctorsListCase getDoctorsListCase,
  })  : _getHomeDataCase = getHomeDataCase,
        _getDoctorsListCase = getDoctorsListCase,
        super(HomeState.initial);

  Future<void> getDoctorsList() async {
    emit(HomeState.loading);
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final result = await _getDoctorsListCase(
      cancelToken: _cancelToken!,
    );

    result.fold(
      (failure) {
        emit(HomeState.error(message: failure.message));
      },
      (response) {
        if (response.list != null && response.list!.isNotEmpty) {
          emit(HomeState.doctorsLoaded(response.list!, response.description));
        } else {
          emit(HomeState.doctorsLoaded([], response.description));
        }
      },
    );
  }

  void init() {
    getDoctorsList();
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}
