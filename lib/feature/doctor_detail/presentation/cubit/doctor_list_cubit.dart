import '../../../../global_imports.dart';
import '../../domain/entities/doctor_list_entity.dart';
import '../../domain/usecases/get_doctors_list_case.dart';

part 'doctor_list_state.dart';

class DoctorListCubit extends Cubit<DoctorListState>
    with CubitLifecycleMixin<DoctorListState> {
  final GetDoctorsListCase _getDoctorsListCase;
  CancelToken? _cancelToken;

  DoctorListCubit({required GetDoctorsListCase getDoctorsListCase})
    : _getDoctorsListCase = getDoctorsListCase,
      super(DoctorListState.initial);

  Future<void> getDoctorsList() async {
    emit(DoctorListState.loading);
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final result = await _getDoctorsListCase(cancelToken: _cancelToken!);

    result.fold(
      (failure) {
        emit(DoctorListState.error(message: failure.message));
      },
      (response) {
        if (response.list != null && response.list!.isNotEmpty) {
          emit(
            DoctorListState.doctorsLoaded(response.list!, response.description),
          );
        } else {
          emit(DoctorListState.doctorsLoaded([], response.description));
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
