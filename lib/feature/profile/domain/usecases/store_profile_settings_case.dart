import '../../../../global_imports.dart';
import '../entities/profile_settings_entity.dart';
import '../repository/profile_settings_repository.dart';

/// Use Case: Store Profile Settings
/// Calls POST /v1/profile/store_profile_setting API using stored token
class StoreProfileSettingsCase {
  final ProfileSettingsRepository repository;

  StoreProfileSettingsCase(this.repository);

  Future<Either<Failure, ApiResponse<ProfileSettingsEntity>>> call({
    required ProfileSettingsEntity settings,
    required CancelToken cancelToken,
  }) {
    return repository.storeProfileSettings(
      settings: settings,
      cancelToken: cancelToken,
    );
  }
}


