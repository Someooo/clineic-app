part of 'home_cubit.dart';

class HomeState {
  final String status;
  final String? message;
  final dynamic data;
  final List<DoctorEntity> doctors;

  const HomeState({
    required this.status,
    this.message,
    this.data,
    this.doctors = const [],
  });

  static const HomeState initial = HomeState(status: 'initial');
  static const HomeState loading = HomeState(status: 'loading');
  
  static HomeState loaded(dynamic data, String message) {
    return HomeState(status: 'loaded', data: data, message: message);
  }
  
  static HomeState doctorsLoaded(List<DoctorEntity> doctors, String message) {
    return HomeState(
      status: 'doctors_loaded',
      doctors: doctors,
      message: message,
    );
  }
  
  static HomeState error({required String message, String? title}) {
    return HomeState(status: 'error', message: message);
  }
}
