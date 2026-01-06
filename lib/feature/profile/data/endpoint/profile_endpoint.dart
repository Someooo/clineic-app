class ProfileEndpoint {
  /// GET /v1/profile/setting - Get user profile settings
  /// Requires: Authorization header with Bearer token
  static const String getProfileSettings = '/v1/profile/setting';

  /// POST /v1/profile/store_profile_setting - Save user profile settings
  /// Requires: Authorization header with Bearer token
  /// Body: { first_name, last_name, email, phone_number, notification_preferences }
  static const String storeProfileSettings = '/v1/profile/store_profile_setting';
}

