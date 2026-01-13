class DoctorDetailEndpoint {
  static String getDoctorDetail(int doctorId) =>
      '/api/doctor/profile/$doctorId';
  static const String getDoctorsList = '/api/doctor/list';
}
