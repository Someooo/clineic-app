import '../../../../global_imports.dart';


part 'auth_entity.freezed.dart';

@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required int id,
    required String firstName,
    String? secondName,
    String? thirdName,
    required String lastName,
    required String slug,
    required String email,
    required int locationId,
    String? verificationCode,
    dynamic userVerified,
    dynamic packageExpiry,
    required String createdAt,
    required String updatedAt,
    String? dateOfBirth,
    String? phoneNumber,
    String? patientCardNumber,
    String? nationalNumber,
    int? secretaryId,
    int? receptionistId,
    int? medicalBillerId,
    dynamic weight,
    dynamic height,
    String? occupation,
    dynamic payment,
    String? gender,
    String? refferal,
    String? profilePic,
    int? physiotherapistId,
    String? dbName,
    String? dbUsername,
    String? dbPassword,
    int? hospitalId,
    required int isErp,
    String? medicalType,
    String? patientErpId,
    int? tpaId,
    required String fullName,
  }) = _AuthEntity;
}