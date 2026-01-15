/// Profile Settings Model - Simple class (no Freezed)
/// Represents user profile settings from API response
class ProfileSettingsModel {
  final int? userId;
  final String? amNameBase;
  final String? amSubHeading;
  final String? amFirstName;
  final String? amLastName;
  final String? displayName;
  final String? address;
  final String? latitude;
  final String? longitude;
  final String? location;
  final String? content;
  final String? profileAttachmentId;
  final String? profileImageUrl;
  final String? amShortDescription;
  final String? amMemberships;
  final String? amExperiences;
  final String? amEducation;
  final String? amAward;
  final String? documentUrl;
  final String? documentId;
  final int? documentSize;
  final String? documentName;
  final String? documentVerified;
  final String? regNumber;
  final String? amDownloadsImage;
  final String? downloads;

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final bool? notificationPreferences;

  ProfileSettingsModel({
    this.userId,
    this.amNameBase,
    this.amSubHeading,
    this.amFirstName,
    this.amLastName,
    this.displayName,
    this.address,
    this.latitude,
    this.longitude,
    this.location,
    this.content,
    this.profileAttachmentId,
    this.profileImageUrl,
    this.amShortDescription,
    this.amMemberships,
    this.amExperiences,
    this.amEducation,
    this.amAward,
    this.documentUrl,
    this.documentId,
    this.documentSize,
    this.documentName,
    this.documentVerified,
    this.regNumber,
    this.amDownloadsImage,
    this.downloads,
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
      userId: (json['user_id'] as num?)?.toInt(),
      amNameBase: json['am_name_base'] as String?,
      amSubHeading: json['am_sub_heading'] as String?,
      amFirstName: json['am_first_name'] as String?,
      amLastName: json['am_last_name'] as String?,
      displayName: json['display_name'] as String?,
      address: json['address'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      location: json['location'] as String?,
      content: json['content'] as String?,
      profileAttachmentId: json['profile_attachment_id'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      amShortDescription: json['am_short_description'] as String?,
      amMemberships: json['am_memberships'] as String?,
      amExperiences: json['am_experiences'] as String?,
      amEducation: json['am_education'] as String?,
      amAward: json['am_award'] as String?,
      documentUrl: json['document_url'] as String?,
      documentId: json['document_id'] as String?,
      documentSize: (json['document_size'] as num?)?.toInt(),
      documentName: json['document_name'] as String?,
      documentVerified: json['document_verified'] as String?,
      regNumber: json['reg_number'] as String?,
      amDownloadsImage: json['am_downloads_image'] as String?,
      downloads: json['downloads'] as String?,

      // From API response: "first_name" field
      firstName: json['first_name'] as String? ?? json['am_first_name'] as String?,
      // From API response: "last_name" field
      lastName: json['last_name'] as String? ?? json['am_last_name'] as String?,
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
    final json = <String, dynamic>{
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'notification_preferences': notificationPreferences,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };

    json.removeWhere(
      (key, value) => key != 'user_id' &&
          (value == null || (value is String && value.trim().isEmpty)),
    );

    return json;
  }

  /// Create a copy with updated fields
  ProfileSettingsModel copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    bool? notificationPreferences,
    String? address,
    String? latitude,
    String? longitude,
  }) {
    return ProfileSettingsModel(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      notificationPreferences: notificationPreferences ?? this.notificationPreferences,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

