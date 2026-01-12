import '../../../../global_imports.dart';
import '../../domain/entities/doctor_entity.dart';
import '../../domain/entities/hospital_entity.dart';
import '../../domain/entities/speciality_entity.dart';
import '../../domain/usecases/get_home_data_case.dart';
import '../../domain/usecases/get_doctors_list_case.dart';
import '../../domain/usecases/get_hospitals_list_case.dart';
import '../../domain/usecases/get_specialities_list_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with CubitLifecycleMixin<HomeState> {
  final GetHomeDataCase _getHomeDataCase;
  final GetDoctorsListCase _getDoctorsListCase;
  final GetHospitalsListCase _getHospitalsListCase;
  final GetSpecialitiesListCase _getSpecialitiesListCase;
  CancelToken? _cancelToken;

  HomeCubit({
    required GetHomeDataCase getHomeDataCase,
    required GetDoctorsListCase getDoctorsListCase,
    required GetHospitalsListCase getHospitalsListCase,
    required GetSpecialitiesListCase getSpecialitiesListCase,
  })  : _getHomeDataCase = getHomeDataCase,
        _getDoctorsListCase = getDoctorsListCase,
        _getHospitalsListCase = getHospitalsListCase,
        _getSpecialitiesListCase = getSpecialitiesListCase,
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

  Future<void> getHospitalsList() async {
    emit(HomeState.loading);
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final result = await _getHospitalsListCase(
      cancelToken: _cancelToken!,
    );

    result.fold(
      (failure) {
        emit(HomeState.error(message: failure.message));
      },
      (response) {
        if (response.list != null && response.list!.isNotEmpty) {
          emit(HomeState.hospitalsLoaded(response.list!, response.description));
        } else {
          emit(HomeState.hospitalsLoaded([], response.description));
        }
      },
    );
  }

  Future<void> getSpecialitiesList() async {
    emit(HomeState.loading);
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final result = await _getSpecialitiesListCase(
      cancelToken: _cancelToken!,
    );

    result.fold(
      (failure) {
        emit(HomeState.error(message: failure.message));
      },
      (response) {
        if (response.list != null && response.list!.isNotEmpty) {
          emit(HomeState.specialitiesLoaded(response.list!, response.description));
        } else {
          emit(HomeState.specialitiesLoaded([], response.description));
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
