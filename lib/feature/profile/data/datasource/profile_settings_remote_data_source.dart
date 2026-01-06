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
    required String token,
    required CancelToken cancelToken,
  });

  /// Save profile settings to API
  /// Endpoint: POST /v1/profile/store_profile_setting
  /// Requires: Authorization header with Bearer token
  /// Body: ProfileSettingsModel data
  Future<ApiResponse<ProfileSettingsModel>> storeProfileSettings({
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
    required String token,
    required CancelToken cancelToken,
  }) async {
    // Call GET /v1/profile/setting with Authorization header
    final response = await apiServices.getData(
      ProfileEndpoint.getProfileSettings,
      cancelToken: cancelToken,
      token: token,
    );

    // Parse API response
    // Response structure: { status, message, data: { first_name, last_name, email, ... } }
    final status = response['status'] as String?;
    final message = response['message'] as String? ?? '';
    final data = response['data'] as Map<String, dynamic>?;

    // Map status to hasError (success = false hasError, error = true hasError)
    final hasError = status != 'success';

    // Create ProfileSettingsModel from response data
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
    );

    // Parse API response
    final status = response['status'] as String?;
    final message = response['message'] as String? ?? '';
    final data = response['data'] as Map<String, dynamic>?;

    // Map status to hasError
    final hasError = status != 'success';

    // Create ProfileSettingsModel from response data
    ProfileSettingsModel? settingsModel;
    if (data != null) {
      settingsModel = ProfileSettingsModel.fromJson(data);
    } else if (!hasError) {
      // If success but no data, return the settings we sent
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

