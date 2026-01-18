import '../../../../global_imports.dart';
import '../endpoint/hospital_endpoint.dart';
import '../model/team_model.dart';

abstract class TeamRemoteDataSource {
  Future<ApiResponse<TeamModel>> getHospitalTeamList({
    required int userId,
    required String status,
    required int pageNumber,
    required int showUsers,
    required CancelToken cancelToken,
  });
}

class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  final ApiServices apiServices;

  TeamRemoteDataSourceImpl(this.apiServices);

  @override
  Future<ApiResponse<TeamModel>> getHospitalTeamList({
    required int userId,
    required String status,
    required int pageNumber,
    required int showUsers,
    required CancelToken cancelToken,
  }) async {
    try {
      final url = '${HospitalEndpoint.getTeamList}?user_id=$userId&status=$status&page_number=$pageNumber&show_users=$showUsers';
      print('🚀 Team API Request: $url');
      
      final response = await apiServices.getData(
        url,
        cancelToken: cancelToken,
      );

      print('📥 Team API Response Type: ${response.runtimeType}');
      
      // Handle direct array response (team API returns array directly)
      List<dynamic> data;
      String message = 'Success';
      String apiStatus = 'success';
      
      if (response is List) {
        print('✅ Team API: Received direct array response');
        data = response;
      } else if (response is Map<String, dynamic>) {
        print('✅ Team API: Received object response');
        apiStatus = response['status'] as String? ?? 'success';
        message = response['message'] as String? ?? 'Success';
        data = response['data'] as List<dynamic>? ?? [];
        
        print('📥 Team API Response Status: $apiStatus');
        print('📥 Team API Message: $message');
      } else {
        print('❌ Team API Error: Unexpected response format');
        return ApiResponse<TeamModel>(
          description: 'Unexpected response format',
          code: 500,
          hasError: true,
        );
      }

      print('✅ Team API Data Count: ${data.length}');

      final hasError = apiStatus != 'success';

      if (hasError) {
        print('❌ Team API Business Error: $message');
        return ApiResponse<TeamModel>(
          description: message,
          code: 400,
          hasError: true,
        );
      }

      if (data.isEmpty) {
        print('⚠️ Team API: No data returned');
        return ApiResponse<TeamModel>(
          description: message,
          code: 200,
          hasError: false,
          list: [],
        );
      }

      final teamList = data
          .map((json) {
            print('👤 Parsing team member: $json');
            return TeamModel.fromJson(json as Map<String, dynamic>);
          })
          .toList();

      print('✅ Team API Success: Parsed ${teamList.length} team members');

      return ApiResponse<TeamModel>(
        description: message,
        code: 200,
        hasError: false,
        list: teamList,
      );
    } catch (e, stackTrace) {
      print('💥 Team API Exception: $e');
      print('💥 Team API Stack Trace: $stackTrace');
      return ApiResponse<TeamModel>(
        description: 'Exception: ${e.toString()}',
        code: 500,
        hasError: true,
      );
    }
  }
}
