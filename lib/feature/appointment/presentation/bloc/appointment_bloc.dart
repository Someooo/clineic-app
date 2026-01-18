import 'package:bloc/bloc.dart';
import '../../domain/usecases/get_appointments_usecase.dart';
import 'appointment_event.dart';
import 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final GetAppointmentsUseCase getAppointmentsUseCase;

  AppointmentBloc({required this.getAppointmentsUseCase})
      : super(AppointmentInitial()) {
    on<GetAppointmentsEvent>(_onGetAppointments);
  }

  Future<void> _onGetAppointments(
    GetAppointmentsEvent event,
    Emitter<AppointmentState> emit,
  ) async {
    emit(AppointmentLoading());
    
    final result = await getAppointmentsUseCase(
      userId: event.userId,
      appointmentDate: event.appointmentDate,
    );

    result.fold(
      (error) => emit(AppointmentError(error)),
      (appointments) => emit(AppointmentLoaded(appointments)),
    );
  }
}
