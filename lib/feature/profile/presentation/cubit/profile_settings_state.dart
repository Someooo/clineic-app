import '../../domain/entities/profile_settings_entity.dart';

/// Profile Settings State - Simple class (no Freezed)
/// Represents different states of profile settings screen
class ProfileSettingsState {
  final bool isLoading;
  final ProfileSettingsEntity? settings;
  final String? errorMessage;
  final bool isSuccess;

  ProfileSettingsState({
    this.isLoading = false,
    this.settings,
    this.errorMessage,
    this.isSuccess = false,
  });

  /// Initial state
  factory ProfileSettingsState.initial() {
    return ProfileSettingsState();
  }

  /// Loading state
  factory ProfileSettingsState.loading() {
    return ProfileSettingsState(isLoading: true);
  }

  /// Loaded state with settings data
  factory ProfileSettingsState.loaded(ProfileSettingsEntity settings) {
    return ProfileSettingsState(settings: settings);
  }

  /// Error state
  factory ProfileSettingsState.error(String message) {
    return ProfileSettingsState(errorMessage: message);
  }

  /// Success state (after saving)
  factory ProfileSettingsState.success(ProfileSettingsEntity settings, String message) {
    return ProfileSettingsState(
      settings: settings,
      isSuccess: true,
    );
  }

  /// Copy with method for updating state
  ProfileSettingsState copyWith({
    bool? isLoading,
    ProfileSettingsEntity? settings,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return ProfileSettingsState(
      isLoading: isLoading ?? this.isLoading,
      settings: settings ?? this.settings,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

