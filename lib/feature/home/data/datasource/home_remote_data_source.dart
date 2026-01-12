import '../../../../global_imports.dart';
import '../model/doctor_model.dart';
import '../model/hospital_model.dart';
import '../endpoint/home_endpoint.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResponse<DoctorModel>> getDoctorsList({
    required CancelToken cancelToken,
  });
  
  Future<ApiResponse<HospitalModel>> getHospitalsList({
    required CancelToken cancelToken,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<ApiResponse<DoctorModel>> getDoctorsList({
    required CancelToken cancelToken,
  }) async {
    final response = await apiServices.getData(
      HomeEndpoint.getDoctorsList,
      cancelToken: cancelToken,
    );

    final status = response['status'] as String?;
    final message = response['message'] as String? ?? '';
    final data = response['data'] as List<dynamic>?;
    
    final hasError = status != 'success';
    
    if (hasError || data == null) {
      return ApiResponse<DoctorModel>(
        hasError: true,
        description: message,
        code: hasError ? 400 : 200,
        list: [],
      );
    }

    final doctorsList = data
        .map((item) => DoctorModel.fromJson(item as Map<String, dynamic>))
        .toList();

    return ApiResponse<DoctorModel>(
      hasError: false,
      description: message,
      code: 200,
      list: doctorsList,
    );
  }

  @override
  Future<ApiResponse<HospitalModel>> getHospitalsList({
    required CancelToken cancelToken,
  }) async {
    final response = await apiServices.getData(
      HomeEndpoint.getHospitalsList,
      cancelToken: cancelToken,
    );

    final status = response['status'] as String?;
    final message = response['message'] as String? ?? '';
    final data = response['data'] as List<dynamic>?;
    
    final hasError = status != 'success';
    
    if (hasError || data == null) {
      return ApiResponse<HospitalModel>(
        hasError: true,
        description: message,
        code: hasError ? 400 : 200,
        list: [],
      );
    }

    final hospitalsList = data
        .map((item) => HospitalModel.fromJson(item as Map<String, dynamic>))
        .toList();

    return ApiResponse<HospitalModel>(
      hasError: false,
      description: message,
      code: 200,
      list: hospitalsList,
    );
  }
}
