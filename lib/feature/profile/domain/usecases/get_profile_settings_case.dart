import '../../../../global_imports.dart';
import '../entities/profile_settings_entity.dart';
import '../repository/profile_settings_repository.dart';

/// Use Case: Get Profile Settings
/// Calls GET /v1/profile/setting API using stored token
class GetProfileSettingsCase {
  final ProfileSettingsRepository repository;

  GetProfileSettingsCase(this.repository);

  Future<Either<Failure, ApiResponse<ProfileSettingsEntity>>> call({
    required CancelToken cancelToken,
  }) {
    return repository.getProfileSettings(cancelToken: cancelToken);
  }
}


