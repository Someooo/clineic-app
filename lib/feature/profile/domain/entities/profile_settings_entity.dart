/// Profile Settings Entity - Domain layer representation
/// Simple class (no Freezed) representing profile settings
class ProfileSettingsEntity {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final bool notificationPreferences;

  ProfileSettingsEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.notificationPreferences = false,
  });
}


