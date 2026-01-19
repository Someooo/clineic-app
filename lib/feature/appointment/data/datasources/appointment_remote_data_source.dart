import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/appointment_model.dart';

abstract class AppointmentRemoteDataSource {
  Future<Either<String, List<AppointmentModel>>> getAppointments({
    required int userId,
    String? appointmentDate,
    String? status,
  });
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  final http.Client client;

  AppointmentRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<String, List<AppointmentModel>>> getAppointments({
    required int userId,
    String? appointmentDate,
    String? status,
  }) async {
    try {
      final queryParams = <String, String>{
        'user_id': userId.toString(),
      };
      
      if (appointmentDate != null) {
        queryParams['appointment_date'] = appointmentDate;
      }
      
      if (status != null) {
        queryParams['status'] = status;
      }

      final uri = Uri.parse(
        'https://clinic.code-pro.io/api/v1/appointments/get_patient_listing',
      ).replace(queryParameters: queryParams);

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final appointments = jsonData
            .map((json) => AppointmentModel.fromJson(json))
            .toList();
        return Right(appointments);
      } else {
        return Left('Failed to load appointments: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Network error: $e');
    }
  }
}
