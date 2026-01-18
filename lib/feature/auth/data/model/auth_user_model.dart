import '../../../../global_imports.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

@freezed
abstract class AuthUserModel with _$AuthUserModel {
  @HiveType(typeId: 100, adapterName: 'AuthUserModelAdapter')
  const factory AuthUserModel({
    @HiveField(1) @JsonKey(name: "id") required int id,
    @HiveField(2) @JsonKey(name: "first_name") required String firstName,
    @HiveField(3) @JsonKey(name: "second_name") String? secondName,
    @HiveField(4) @JsonKey(name: "third_name") String? thirdName,
    @HiveField(5) @JsonKey(name: "last_name") required String lastName,
    @HiveField(6) @JsonKey(name: "slug") required String slug,
    @HiveField(7) @JsonKey(name: "email") required String email,
    @HiveField(8) @JsonKey(name: "location_id") int? locationId,
    @HiveField(9) @JsonKey(name: "verification_code") String? verificationCode,
    @HiveField(10) @JsonKey(name: "user_verified") Object? userVerified,
    @HiveField(11) @JsonKey(name: "package_expiry") Object? packageExpiry,
    @HiveField(12) @JsonKey(name: "created_at") required String createdAt,
    @HiveField(13) @JsonKey(name: "updated_at") required String updatedAt,
    @HiveField(14) @JsonKey(name: "date_of_birth") String? dateOfBirth,
    @HiveField(15) @JsonKey(name: "phone_number") String? phoneNumber,
    @HiveField(16) @JsonKey(name: "patient_card_number") String? patientCardNumber,
    @HiveField(17) @JsonKey(name: "national_number") String? nationalNumber,
    @HiveField(18) @JsonKey(name: "secretary_id") int? secretaryId,
    @HiveField(19) @JsonKey(name: "receptionist_id") int? receptionistId,
    @HiveField(20) @JsonKey(name: "medical_biller_id") int? medicalBillerId,
    @HiveField(21) @JsonKey(name: "weight") Object? weight,
    @HiveField(22) @JsonKey(name: "height") Object? height,
    @HiveField(23) @JsonKey(name: "occupation") String? occupation,
    @HiveField(24) @JsonKey(name: "payment") Object? payment,
    @HiveField(25) @JsonKey(name: "gender") String? gender,
    @HiveField(26) @JsonKey(name: "refferal") String? refferal,
    @HiveField(27) @JsonKey(name: "profile_pic") String? profilePic,
    @HiveField(28) @JsonKey(name: "physiotherapist_id") int? physiotherapistId,
    @HiveField(29) @JsonKey(name: "db_name") String? dbName,
    @HiveField(30) @JsonKey(name: "db_username") String? dbUsername,
    @HiveField(31) @JsonKey(name: "db_password") String? dbPassword,
    @HiveField(32) @JsonKey(name: "hospital_id") String? hospitalId,
    @HiveField(33) @JsonKey(name: "is_erp") required int isErp,
    @HiveField(34) @JsonKey(name: "medical_type") String? medicalType,
    @HiveField(35) @JsonKey(name: "patient_erp_id") String? patientErpId,
    @HiveField(36) @JsonKey(name: "tpa_id") int? tpaId,
    @HiveField(37) @JsonKey(name: "full_name") required String fullName,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
}
