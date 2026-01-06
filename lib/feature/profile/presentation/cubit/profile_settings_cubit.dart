import '../../../../global_imports.dart';
import '../../domain/entities/profile_settings_entity.dart';
import '../../domain/usecases/get_profile_settings_case.dart';
import '../../domain/usecases/store_profile_settings_case.dart';
import 'profile_settings_state.dart';

/// Profile Settings Cubit - Manages profile settings state
/// 
/// Responsibilities:
/// - Load profile settings from API (GET /v1/profile/setting)
/// - Save profile settings to API (POST /v1/profile/store_profile_setting)
/// - Handle loading, error, and success states
/// - Uses stored token from login for API authorization
class ProfileSettingsCubit extends Cubit<ProfileSettingsState>
    with CubitLifecycleMixin<ProfileSettingsState> {
  final GetProfileSettingsCase _getProfileSettingsCase;
  final StoreProfileSettingsCase _storeProfileSettingsCase;

  ProfileSettingsCubit({
    required GetProfileSettingsCase getProfileSettingsCase,
    required StoreProfileSettingsCase storeProfileSettingsCase,
  })  : _getProfileSettingsCase = getProfileSettingsCase,
        _storeProfileSettingsCase = storeProfileSettingsCase,
        super(ProfileSettingsState.initial());

  /// Load profile settings from API
  /// Endpoint: GET /v1/profile/setting
  /// Uses stored token from login for Authorization header
  Future<void> loadProfileSettings() async {
    safeEmit(ProfileSettingsState.loading());

    final result = await _getProfileSettingsCase(cancelToken: cancelToken);
    if (isClosed) return;

    result.fold(
      (failure) {
        // Error occurred - emit error state
        safeEmit(ProfileSettingsState.error(failure.message));
      },
      (response) {
        if (response.data != null) {
          // Success - emit loaded state with settings data
          // Data comes from: GET /v1/profile/setting API response
          safeEmit(ProfileSettingsState.loaded(response.data!));
        } else {
          // No data returned
          safeEmit(ProfileSettingsState.error(response.description));
        }
      },
    );
  }

  /// Save profile settings to API
  /// Endpoint: POST /v1/profile/store_profile_setting
  /// Uses stored token from login for Authorization header
  /// 
  /// Parameters:
  /// - firstName: from TextEditingController
  /// - lastName: from TextEditingController
  /// - email: from TextEditingController
  /// - phoneNumber: from TextEditingController
  /// - notificationPreferences: from Switch widget
  Future<void> saveProfileSettings({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required bool notificationPreferences,
  }) async {
    safeEmit(ProfileSettingsState.loading());

    // Create entity from form data
    final settings = ProfileSettingsEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      notificationPreferences: notificationPreferences,
    );

    final result = await _storeProfileSettingsCase(
      settings: settings,
      cancelToken: cancelToken,
    );
    if (isClosed) return;

    result.fold(
      (failure) {
        // Error occurred - emit error state
        safeEmit(ProfileSettingsState.error(failure.message));
      },
      (response) {
        if (response.data != null) {
          // Success - emit success state with updated settings
          // Data comes from: POST /v1/profile/store_profile_setting API response
          safeEmit(ProfileSettingsState.success(
            response.data!,
            response.description,
          ));
        } else {
          // No data returned
          safeEmit(ProfileSettingsState.error(response.description));
        }
      },
    );
  }
}

