/// Profile Settings Entity - Domain layer representation
/// Simple class (no Freezed) representing profile settings
class ProfileSettingsEntity {
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
  final bool notificationPreferences;

  ProfileSettingsEntity({
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
    this.notificationPreferences = false,
  });
}


