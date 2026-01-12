import '../../../../global_imports.dart';
import '../../../../core/constant/api_path.dart';
import '../model/doctor_model.dart';
import '../model/hospital_model.dart';
import '../model/speciality_model.dart';
import '../endpoint/home_endpoint.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResponse<DoctorModel>> getDoctorsList({
    required CancelToken cancelToken,
  });
  
  Future<ApiResponse<HospitalModel>> getHospitalsList({
    required CancelToken cancelToken,
  });
  
  Future<ApiResponse<SpecialityModel>> getSpecialitiesList({
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

  @override
  Future<ApiResponse<SpecialityModel>> getSpecialitiesList({
    required CancelToken cancelToken,
  }) async {
    try {
      // The API returns a direct array (List), not wrapped in Map
      // So we need to use Dio directly instead of getData which expects Map
      final dio = Dio();
      final headers = await ApiServices.getHeaders;
      dio.options = BaseOptions(
        baseUrl: ApiPath.baseUrl,
        headers: headers,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      );
      
      final response = await dio.get(
        HomeEndpoint.getSpecialitiesList,
        cancelToken: cancelToken,
      );
      
      final data = response.data;
      
      if (data == null || data is! List) {
        return ApiResponse<SpecialityModel>(
          hasError: true,
          description: 'Invalid response format',
          code: 400,
          list: [],
        );
      }

      final specialitiesList = data
          .map((item) => SpecialityModel.fromJson(item as Map<String, dynamic>))
          .toList();

      return ApiResponse<SpecialityModel>(
        hasError: false,
        description: 'Success',
        code: 200,
        list: specialitiesList,
      );
    } catch (e) {
      return ApiResponse<SpecialityModel>(
        hasError: true,
        description: e.toString(),
        code: 400,
        list: [],
      );
    }
  }
}
