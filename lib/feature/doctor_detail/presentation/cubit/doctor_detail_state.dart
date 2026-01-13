part of 'doctor_detail_cubit.dart';

class DoctorDetailState {
  final String status;
  final String? message;
  final DoctorDetailEntity? doctorDetail;

  const DoctorDetailState({
    required this.status,
    this.message,
    this.doctorDetail,
  });

  static const DoctorDetailState initial = DoctorDetailState(status: 'initial');
  static const DoctorDetailState loading = DoctorDetailState(status: 'loading');

  static DoctorDetailState loaded(DoctorDetailEntity doctorDetail) {
    return DoctorDetailState(status: 'loaded', doctorDetail: doctorDetail);
  }

  static DoctorDetailState error({required String message}) {
    return DoctorDetailState(status: 'error', message: message);
  }
}
