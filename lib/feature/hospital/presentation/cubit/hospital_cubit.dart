import '../../../../global_imports.dart';
import '../../domain/entities/hospital_entity.dart';
import '../../domain/usecases/get_hospitals_list_case.dart';

part 'hospital_state.dart';

class HospitalCubit extends Cubit<HospitalState>
    with CubitLifecycleMixin<HospitalState> {
  final GetHospitalsListCase _getHospitalsListCase;
  CancelToken? _cancelToken;

  HospitalCubit({required GetHospitalsListCase getHospitalsListCase})
    : _getHospitalsListCase = getHospitalsListCase,
      super(HospitalState.initial);

  Future<void> getHospitalsList() async {
    emit(HospitalState.loading);
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final result = await _getHospitalsListCase(cancelToken: _cancelToken!);

    result.fold(
      (failure) {
        emit(HospitalState.error(message: failure.message));
      },
      (response) {
        if (response.list != null && response.list!.isNotEmpty) {
          emit(
            HospitalState.hospitalsLoaded(response.list!, response.description),
          );
        } else {
          emit(HospitalState.hospitalsLoaded([], response.description));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}
