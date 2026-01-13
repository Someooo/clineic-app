import '../../../../global_imports.dart';
import '../endpoint/hospital_endpoint.dart';
import '../model/hospital_model.dart';

abstract class HospitalRemoteDataSource {
  Future<ApiResponse<HospitalModel>> getHospitalsList({
    required CancelToken cancelToken,
  });
}

class HospitalRemoteDataSourceImpl implements HospitalRemoteDataSource {
  final ApiServices apiServices;

  HospitalRemoteDataSourceImpl(this.apiServices);

  @override
  Future<ApiResponse<HospitalModel>> getHospitalsList({
    required CancelToken cancelToken,
  }) async {
    final response = await apiServices.getData(
      HospitalEndpoint.getHospitalsList,
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

    final hospitalsList =
        data
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
