import '../../../../global_imports.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponse<AuthUserModel>> login({
    required String email,
    required String password,
    required CancelToken cancelToken,
  });

  Future<ApiResponse<AuthUserModel>> logout({
    required String token,
    required CancelToken cancelToken,
  });

  Future<ApiResponse<AuthUserModel>> getUser({
    required String token,
    required CancelToken cancelToken,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiServices apiServices;

  AuthRemoteDataSourceImpl(this.apiServices);

  @override
  Future<ApiResponse<AuthUserModel>> login({
    required String email,
    required String password,
    required CancelToken cancelToken,
  }) async {
    final response = await apiServices.postData(
      AuthEndpoint.login,
      {"email": email, "password": password},
      cancelToken: cancelToken,
    );
   
    final status = response['status'] as String?;
    final message = response['message'] as String? ?? '';
    final data = response['data'] as Map<String, dynamic>?;
    final token = data?['token'] as String?;
    
    // Map status to hasError (success = false hasError, error = true hasError)
    final hasError = status != 'success';
    
    // Create ApiResponse with token extracted from data.token
    // Since no user data is returned, data will be null
    return ApiResponse<AuthUserModel>(
      hasError: hasError,
      description: message,
      code: hasError ? 400 : 200,
      token: token,
      data: null, // No user data in login response
    );
  }

  @override
  Future<ApiResponse<AuthUserModel>> logout({
    required String token,
    required CancelToken cancelToken,
  }) async {
    final response = await apiServices.postData(
      AuthEndpoint.logout,
      {},
      cancelToken: cancelToken,
      token: token,
    );

    final apiResponse = ApiResponse.fromJson(
      response,
      (data) => AuthUserModel.fromJson(data),
    );
    return apiResponse;
  }

  @override
  Future<ApiResponse<AuthUserModel>> getUser({
    required String token,
    required CancelToken cancelToken,
  }) async {
    final response = await apiServices.getData(
      AuthEndpoint.getUser,
      cancelToken: cancelToken,
      token: token,
    );

    final apiResponse = ApiResponse.fromJson(
      response,
      (data) => AuthUserModel.fromJson(data),
    );
    return apiResponse;
  }
}
