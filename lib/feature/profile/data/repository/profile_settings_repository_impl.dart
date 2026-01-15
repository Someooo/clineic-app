import '../../../../global_imports.dart';
import '../../../../core/localization/l10n.dart';
import '../../domain/entities/profile_settings_entity.dart';
import '../../domain/repository/profile_settings_repository.dart';
import '../datasource/profile_settings_remote_data_source.dart';
import '../model/profile_settings_model.dart';

/// Profile Settings Repository Implementation
class ProfileSettingsRepositoryImpl implements ProfileSettingsRepository {
  final ProfileSettingsRemoteDataSource remote;
  final AuthLocalDataSource authLocalDataSource;

  ProfileSettingsRepositoryImpl({
    required this.remote,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, ApiResponse<ProfileSettingsEntity>>> getProfileSettings({
    required CancelToken cancelToken,
  }) async {
    try {
      // Get token from local storage (saved after login)
      final token = await authLocalDataSource.getToken();
      if (token == null) {
        return left(ServerFailure(message: L10n.t.unauthorized));
      }

      final user = await authLocalDataSource.getUser();
      if (user == null) {
        return left(ServerFailure(message: L10n.t.unauthorized));
      }

      // Call API to get profile settings
      // Endpoint: GET /v1/profile/setting
      // Authorization: Bearer {token}
      final apiResponse = await remote.getProfileSettings(
        userId: user.id,
        token: token,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError && apiResponse.data != null) {
        // Convert model to entity
        final entity = ProfileSettingsEntity(
          amNameBase: apiResponse.data!.amNameBase,
          amSubHeading: apiResponse.data!.amSubHeading,
          amFirstName: apiResponse.data!.amFirstName,
          amLastName: apiResponse.data!.amLastName,
          displayName: apiResponse.data!.displayName,
          address: apiResponse.data!.address,
          latitude: apiResponse.data!.latitude,
          longitude: apiResponse.data!.longitude,
          location: apiResponse.data!.location,
          content: apiResponse.data!.content,
          profileAttachmentId: apiResponse.data!.profileAttachmentId,
          profileImageUrl: apiResponse.data!.profileImageUrl,
          amShortDescription: apiResponse.data!.amShortDescription,
          amMemberships: apiResponse.data!.amMemberships,
          amExperiences: apiResponse.data!.amExperiences,
          amEducation: apiResponse.data!.amEducation,
          amAward: apiResponse.data!.amAward,
          documentUrl: apiResponse.data!.documentUrl,
          documentId: apiResponse.data!.documentId,
          documentSize: apiResponse.data!.documentSize,
          documentName: apiResponse.data!.documentName,
          documentVerified: apiResponse.data!.documentVerified,
          regNumber: apiResponse.data!.regNumber,
          amDownloadsImage: apiResponse.data!.amDownloadsImage,
          downloads: apiResponse.data!.downloads,

          firstName: apiResponse.data!.firstName,
          lastName: apiResponse.data!.lastName,
          email: apiResponse.data!.email,
          phoneNumber: apiResponse.data!.phoneNumber,
          notificationPreferences: apiResponse.data!.notificationPreferences ?? false,
        );

        return right(
          ApiResponse<ProfileSettingsEntity>(
            hasError: false,
            description: apiResponse.description,
            code: apiResponse.code,
            data: entity,
          ),
        );
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }

  @override
  Future<Either<Failure, ApiResponse<ProfileSettingsEntity>>> storeProfileSettings({
    required ProfileSettingsEntity settings,
    required CancelToken cancelToken,
  }) async {
    try {
      // Get token from local storage (saved after login)
      final token = await authLocalDataSource.getToken();
      if (token == null) {
        return left(ServerFailure(message: L10n.t.unauthorized));
      }

      final user = await authLocalDataSource.getUser();
      if (user == null) {
        return left(ServerFailure(message: L10n.t.unauthorized));
      }

      // Convert entity to model for API call
      final model = ProfileSettingsModel(
        userId: user.id,
        firstName: settings.firstName,
        lastName: settings.lastName,
        email: settings.email,
        phoneNumber: settings.phoneNumber,
        notificationPreferences: settings.notificationPreferences,
        address: settings.address,
        latitude: settings.latitude,
        longitude: settings.longitude,
      );

      // Call API to save profile settings
      // Endpoint: POST /v1/profile/store_profile_setting
      // Authorization: Bearer {token}
      final apiResponse = await remote.storeProfileSettings(
        userId: user.id,
        settings: model,
        token: token,
        cancelToken: cancelToken,
      );

      if (!apiResponse.hasError) {
        final data = apiResponse.data;
        final entity = ProfileSettingsEntity(
          amNameBase: data?.amNameBase,
          amSubHeading: data?.amSubHeading,
          amFirstName: data?.amFirstName,
          amLastName: data?.amLastName,
          displayName: data?.displayName,
          address: data?.address ?? settings.address,
          latitude: data?.latitude ?? settings.latitude,
          longitude: data?.longitude ?? settings.longitude,
          location: data?.location,
          content: data?.content,
          profileAttachmentId: data?.profileAttachmentId,
          profileImageUrl: data?.profileImageUrl,
          amShortDescription: data?.amShortDescription,
          amMemberships: data?.amMemberships,
          amExperiences: data?.amExperiences,
          amEducation: data?.amEducation,
          amAward: data?.amAward,
          documentUrl: data?.documentUrl,
          documentId: data?.documentId,
          documentSize: data?.documentSize,
          documentName: data?.documentName,
          documentVerified: data?.documentVerified,
          regNumber: data?.regNumber,
          amDownloadsImage: data?.amDownloadsImage,
          downloads: data?.downloads,
          firstName: data?.firstName ?? settings.firstName,
          lastName: data?.lastName ?? settings.lastName,
          email: data?.email ?? settings.email,
          phoneNumber: data?.phoneNumber ?? settings.phoneNumber,
          notificationPreferences:
              data?.notificationPreferences ?? settings.notificationPreferences,
        );

        return right(
          ApiResponse<ProfileSettingsEntity>(
            hasError: false,
            description: apiResponse.description,
            code: apiResponse.code,
            data: entity,
          ),
        );
      } else {
        return left(ServerFailure(message: apiResponse.description));
      }
    } catch (e, t) {
      return handleRepoDataError(e, t);
    }
  }
}

