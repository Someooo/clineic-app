import '../../../../global_imports.dart';
import '../entities/profile_settings_entity.dart';

/// Profile Settings Repository Interface
abstract class ProfileSettingsRepository {
  /// Get profile settings from API
  /// Uses stored token from login for Authorization header
  Future<Either<Failure, ApiResponse<ProfileSettingsEntity>>> getProfileSettings({
    required CancelToken cancelToken,
  });

  /// Save profile settings to API
  /// Uses stored token from login for Authorization header
  Future<Either<Failure, ApiResponse<ProfileSettingsEntity>>> storeProfileSettings({
    required ProfileSettingsEntity settings,
    required CancelToken cancelToken,
  });
}


