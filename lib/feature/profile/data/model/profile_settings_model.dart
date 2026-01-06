/// Profile Settings Model - Simple class (no Freezed)
/// Represents user profile settings from API response
class ProfileSettingsModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final bool? notificationPreferences;

  ProfileSettingsModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.notificationPreferences,
  });

  /// Create from JSON response
  /// Data comes from GET /v1/profile/setting API response
  factory ProfileSettingsModel.fromJson(Map<String, dynamic> json) {
    return ProfileSettingsModel(
      // From API response: "first_name" field
      firstName: json['first_name'] as String?,
      // From API response: "last_name" field
      lastName: json['last_name'] as String?,
      // From API response: "email" field
      email: json['email'] as String?,
      // From API response: "phone_number" or "phone" field
      phoneNumber: json['phone_number'] as String? ?? json['phone'] as String?,
      // From API response: "notification_preferences" or "notifications" field
      notificationPreferences: json['notification_preferences'] as bool? ??
          json['notifications'] as bool? ??
          false,
    );
  }

  /// Convert to JSON for POST request
  /// Used when sending data to POST /v1/profile/store_profile_setting
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'notification_preferences': notificationPreferences,
    };
  }

  /// Create a copy with updated fields
  ProfileSettingsModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    bool? notificationPreferences,
  }) {
    return ProfileSettingsModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      notificationPreferences: notificationPreferences ?? this.notificationPreferences,
    );
  }
}

