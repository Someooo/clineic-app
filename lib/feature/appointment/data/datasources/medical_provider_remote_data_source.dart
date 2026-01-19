import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/medical_provider_model.dart';

abstract class MedicalProviderRemoteDataSource {
  Future<Either<String, List<MedicalProviderModel>>> getHospitalDoctorsList();
}

class MedicalProviderRemoteDataSourceImpl implements MedicalProviderRemoteDataSource {
  final http.Client client;

  MedicalProviderRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<String, List<MedicalProviderModel>>> getHospitalDoctorsList() async {
    try {
      final uri = Uri.parse('https://clinic.code-pro.io/api/hospital_doctors/list');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        if (jsonData['status'] == 'success' && jsonData['data'] != null) {
          final List<dynamic> dataList = jsonData['data'];
          final providers = dataList
              .map((json) => MedicalProviderModel.fromJson(json))
              .toList();
          return Right(providers);
        } else {
          return Left('API returned error: ${jsonData['message'] ?? 'Unknown error'}');
        }
      } else {
        return Left('Failed to load hospital doctors: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Network error: $e');
    }
  }
}
