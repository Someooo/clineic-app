import '../../../../global_imports.dart';
import '../../domain/entities/doctor_detail_entity.dart';
import '../../domain/usecases/get_doctor_detail_case.dart';

part 'doctor_detail_state.dart';

class DoctorDetailCubit extends Cubit<DoctorDetailState>
    with CubitLifecycleMixin<DoctorDetailState> {
  final GetDoctorDetailCase _getDoctorDetailCase;
  CancelToken? _cancelToken;

  DoctorDetailCubit({required GetDoctorDetailCase getDoctorDetailCase})
    : _getDoctorDetailCase = getDoctorDetailCase,
      super(DoctorDetailState.initial);

  Future<void> getDoctorDetail(int doctorId) async {
    emit(DoctorDetailState.loading);
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final result = await _getDoctorDetailCase(
      doctorId: doctorId,
      cancelToken: _cancelToken!,
    );

    result.fold(
      (failure) {
        emit(DoctorDetailState.error(message: failure.message));
      },
      (response) {
        if (response.data != null) {
          emit(DoctorDetailState.loaded(response.data!));
        } else {
          emit(DoctorDetailState.error(message: response.description));
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
