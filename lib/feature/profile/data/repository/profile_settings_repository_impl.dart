import '../../../../global_imports.dart';
import '../../domain/entities/profile_settings_entity.dart';
import '../../domain/repository/profile_settings_repository.dart';
import '../datasource/profile_settings_remote_data_source.dart';
import '../model/profile_settings_model.dart';

/// Profile Settings Repository Implementation
class ProfileSettingsRepositoryImpl implements ProfileSettingsRepository {
  final ProfileSettingsRemoteDataSource remote;
  final AuthLocalDataSource authLocalDataSource;

  ProfileSettingsRepositoryImpl({
    required this.remote,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, ApiResponse<ProfileSettingsEntity>>> getProfileSettings({
    required CancelToken cancelToken,
  }) async {
    try {
      // Get token from local storage (saved after login)
      final token = await authLocalDataSource.getToken();
      if (token == null) {
        return left(ServerFailure(message: AppStrings.unauthorized.tr()));
      }

      // Call API to get profile settings
      // Endpoint: GET /v1/profile/setting
      // Authorization: Bearer {token}
      final apiResponse = await remote.getProfileSettings(
        token: token,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError && apiResponse.data != null) {
        // Convert model to entity
        final entity = ProfileSettingsEntity(
          firstName: apiResponse.data!.firstName,
          lastName: apiResponse.data!.lastName,
          email: apiResponse.data!.email,
          phoneNumber: apiResponse.data!.phoneNumber,
          notificationPreferences: apiResponse.data!.notificationPreferences ?? false,
        );

        return right(
          ApiResponse<ProfileSettingsEntity>(
            hasError: false,
            description: apiResponse.description,
            code: apiResponse.code,
            data: entity,
          ),
        );
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }

  @override
  Future<Either<Failure, ApiResponse<ProfileSettingsEntity>>> storeProfileSettings({
    required ProfileSettingsEntity settings,
    required CancelToken cancelToken,
  }) async {
    try {
      // Get token from local storage (saved after login)
      final token = await authLocalDataSource.getToken();
      if (token == null) {
        return left(ServerFailure(message: AppStrings.unauthorized.tr()));
      }

      // Convert entity to model for API call
      final model = ProfileSettingsModel(
        firstName: settings.firstName,
        lastName: settings.lastName,
        email: settings.email,
        phoneNumber: settings.phoneNumber,
        notificationPreferences: settings.notificationPreferences,
      );

      // Call API to save profile settings
      // Endpoint: POST /v1/profile/store_profile_setting
      // Authorization: Bearer {token}
      final apiResponse = await remote.storeProfileSettings(
        settings: model,
        token: token,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError && apiResponse.data != null) {
        // Convert model to entity
        final entity = ProfileSettingsEntity(
          firstName: apiResponse.data!.firstName,
          lastName: apiResponse.data!.lastName,
          email: apiResponse.data!.email,
          phoneNumber: apiResponse.data!.phoneNumber,
          notificationPreferences: apiResponse.data!.notificationPreferences ?? false,
        );

        return right(
          ApiResponse<ProfileSettingsEntity>(
            hasError: false,
            description: apiResponse.description,
            code: apiResponse.code,
            data: entity,
          ),
        );
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }
}

