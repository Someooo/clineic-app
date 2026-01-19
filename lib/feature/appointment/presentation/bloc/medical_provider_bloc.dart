import 'package:bloc/bloc.dart';
import '../../domain/usecases/get_hospital_doctors_usecase.dart';
import 'medical_provider_event.dart';
import 'medical_provider_state.dart';

class MedicalProviderBloc extends Bloc<MedicalProviderEvent, MedicalProviderState> {
  final GetHospitalDoctorsUseCase getHospitalDoctorsUseCase;

  MedicalProviderBloc({required this.getHospitalDoctorsUseCase})
      : super(MedicalProviderInitial()) {
    on<GetHospitalDoctorsEvent>(_onGetHospitalDoctors);
  }

  Future<void> _onGetHospitalDoctors(
    GetHospitalDoctorsEvent event,
    Emitter<MedicalProviderState> emit,
  ) async {
    emit(MedicalProviderLoading());
    
    final result = await getHospitalDoctorsUseCase();

    result.fold(
      (error) => emit(MedicalProviderError(error)),
      (providers) {
        final hospitals = providers.where((p) => p.isHospital).toList();
        final doctors = providers.where((p) => !p.isHospital).toList();
        emit(MedicalProviderLoaded(
          hospitals: hospitals,
          doctors: doctors,
        ));
      },
    );
  }
}
