import '../../../../global_imports.dart';
import '../endpoint/profile_endpoint.dart';
import '../model/profile_settings_model.dart';

/// Remote Data Source for Profile Settings
/// Handles API calls to get and save profile settings
abstract class ProfileSettingsRemoteDataSource {
  /// Get profile settings from API
  /// Endpoint: GET /v1/profile/setting
  /// Requires: Authorization header with Bearer token
  Future<ApiResponse<ProfileSettingsModel>> getProfileSettings({
    required int userId,
    required String token,
    required CancelToken cancelToken,
  });

  /// Save profile settings to API
  /// Endpoint: POST /v1/profile/store_profile_setting
  /// Requires: Authorization header with Bearer token
  /// Body: ProfileSettingsModel data
  Future<ApiResponse<ProfileSettingsModel>> storeProfileSettings({
    required int userId,
    required ProfileSettingsModel settings,
    required String token,
    required CancelToken cancelToken,
  });
}

class ProfileSettingsRemoteDataSourceImpl
    implements ProfileSettingsRemoteDataSource {
  final ApiServices apiServices;

  ProfileSettingsRemoteDataSourceImpl(this.apiServices);

  @override
  Future<ApiResponse<ProfileSettingsModel>> getProfileSettings({
    required int userId,
    required String token,
    required CancelToken cancelToken,
  }) async {
    // Call GET /v1/profile/setting with Authorization header
    final response = await apiServices.getData(
      ProfileEndpoint.getProfileSettings,
      cancelToken: cancelToken,
      token: token,
      queryParameters: {
        'id': userId,
      },
    );

    // API may return either:
    // 1) Wrapped: {status, message, data: {...}}
    // 2) Unwrapped: {...fields}
    final bool isWrapped = response.containsKey('status') || response.containsKey('data');

    final String? status = isWrapped ? response['status'] as String? : 'success';
    final String message = isWrapped ? (response['message'] as String? ?? '') : '';
    final Map<String, dynamic>? data = isWrapped
        ? (response['data'] as Map<String, dynamic>?)
        : response;

    final bool hasError = status != 'success';

    ProfileSettingsModel? settingsModel;
    if (data != null) {
      settingsModel = ProfileSettingsModel.fromJson(data);
    }

    return ApiResponse<ProfileSettingsModel>(
      hasError: hasError,
      description: message,
      code: hasError ? 400 : 200,
      data: settingsModel,
    );
  }

  @override
  Future<ApiResponse<ProfileSettingsModel>> storeProfileSettings({
    required int userId,
    required ProfileSettingsModel settings,
    required String token,
    required CancelToken cancelToken,
  }) async {
    // Call POST /v1/profile/store_profile_setting with Authorization header
    final response = await apiServices.postData(
      ProfileEndpoint.storeProfileSettings,
      settings.toJson(),
      cancelToken: cancelToken,
      token: token,
      queryParameters: {
        'id': userId,
      },
    );

    // API may return either:
    // 1) Wrapped: {status, message, data: {...}}
    // 2) New: {type: success, role: null, message: "Personal Details Saved"}
    final String? status = response['status'] as String?;
    final String? type = response['type'] as String?;
    final String message = (response['message'] as String?) ?? '';
    final Map<String, dynamic>? data = response['data'] as Map<String, dynamic>?;

    final bool hasError = (status != null)
        ? status != 'success'
        : (type != null)
            ? type != 'success'
            : false;

    ProfileSettingsModel? settingsModel;
    if (data != null) {
      settingsModel = ProfileSettingsModel.fromJson(data);
    } else if (!hasError) {
      // success response doesn't return data, so keep what we submitted
      settingsModel = settings;
    }

    return ApiResponse<ProfileSettingsModel>(
      hasError: hasError,
      description: message,
      code: hasError ? 400 : 200,
      data: settingsModel,
    );
  }
}

