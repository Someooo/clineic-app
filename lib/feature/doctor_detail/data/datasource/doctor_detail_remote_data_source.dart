import '../../../../global_imports.dart';
import '../endpoint/doctor_detail_endpoint.dart';
import '../model/doctor_detail_model.dart';
import '../model/doctor_list_model.dart';

abstract class DoctorDetailRemoteDataSource {
  Future<ApiResponse<DoctorDetailModel>> getDoctorDetail({
    required int doctorId,
    required CancelToken cancelToken,
  });

  Future<ApiResponse<DoctorListModel>> getDoctorsList({
    required CancelToken cancelToken,
  });
}

class DoctorDetailRemoteDataSourceImpl implements DoctorDetailRemoteDataSource {
  final ApiServices apiServices;

  DoctorDetailRemoteDataSourceImpl(this.apiServices);

  @override
  Future<ApiResponse<DoctorDetailModel>> getDoctorDetail({
    required int doctorId,
    required CancelToken cancelToken,
  }) async {
    final response = await apiServices.getData(
      DoctorDetailEndpoint.getDoctorDetail(doctorId),
      cancelToken: cancelToken,
    );

    final status = response['status'] as String?;
    final message = response['message'] as String? ?? '';
    final data = response['data'] as Map<String, dynamic>?;

    final hasError = status != 'success';

    DoctorDetailModel? detailModel;
    if (data != null) {
      try {
        detailModel = DoctorDetailModel.fromJson(data);
      } catch (e) {
        return ApiResponse<DoctorDetailModel>(
          hasError: true,
          description: 'Failed to parse doctor detail: $e',
          code: 400,
        );
      }
    }

    return ApiResponse<DoctorDetailModel>(
      hasError: hasError,
      description: message,
      code: hasError ? 400 : 200,
      data: detailModel,
    );
  }

  @override
  Future<ApiResponse<DoctorListModel>> getDoctorsList({
    required CancelToken cancelToken,
  }) async {
    final response = await apiServices.getData(
      DoctorDetailEndpoint.getDoctorsList,
      cancelToken: cancelToken,
    );

    final status = response['status'] as String?;
    final message = response['message'] as String? ?? '';
    final data = response['data'] as List<dynamic>?;

    final hasError = status != 'success';

    if (hasError || data == null) {
      return ApiResponse<DoctorListModel>(
        hasError: true,
        description: message,
        code: hasError ? 400 : 200,
        list: [],
      );
    }

    final doctorsList =
        data
            .map(
              (item) => DoctorListModel.fromJson(item as Map<String, dynamic>),
            )
            .toList();

    return ApiResponse<DoctorListModel>(
      hasError: false,
      description: message,
      code: 200,
      list: doctorsList,
    );
  }
}
