part of 'doctor_list_cubit.dart';

class DoctorListState {
  final String status;
  final String? message;
  final List<DoctorListEntity> doctors;

  const DoctorListState({
    required this.status,
    this.message,
    this.doctors = const [],
  });

  static const DoctorListState initial = DoctorListState(status: 'initial');
  static const DoctorListState loading = DoctorListState(status: 'loading');

  static DoctorListState doctorsLoaded(
    List<DoctorListEntity> doctors,
    String message,
  ) {
    return DoctorListState(
      status: 'doctors_loaded',
      doctors: doctors,
      message: message,
    );
  }

  static DoctorListState error({required String message}) {
    return DoctorListState(status: 'error', message: message);
  }
}
