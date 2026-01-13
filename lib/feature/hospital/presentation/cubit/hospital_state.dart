part of 'hospital_cubit.dart';

class HospitalState {
  final String status;
  final String? message;
  final List<HospitalEntity> hospitals;

  const HospitalState({
    required this.status,
    this.message,
    this.hospitals = const [],
  });

  static const HospitalState initial = HospitalState(status: 'initial');
  static const HospitalState loading = HospitalState(status: 'loading');

  static HospitalState hospitalsLoaded(
    List<HospitalEntity> hospitals,
    String message,
  ) {
    return HospitalState(
      status: 'hospitals_loaded',
      hospitals: hospitals,
      message: message,
    );
  }

  static HospitalState error({required String message}) {
    return HospitalState(status: 'error', message: message);
  }
}
