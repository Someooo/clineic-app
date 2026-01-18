// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserModel {

@HiveField(1)@JsonKey(name: "id") int get id;@HiveField(2)@JsonKey(name: "first_name") String get firstName;@HiveField(3)@JsonKey(name: "second_name") String? get secondName;@HiveField(4)@JsonKey(name: "third_name") String? get thirdName;@HiveField(5)@JsonKey(name: "last_name") String get lastName;@HiveField(6)@JsonKey(name: "slug") String get slug;@HiveField(7)@JsonKey(name: "email") String get email;@HiveField(8)@JsonKey(name: "location_id") int? get locationId;@HiveField(9)@JsonKey(name: "verification_code") String? get verificationCode;@HiveField(10)@JsonKey(name: "user_verified") Object? get userVerified;@HiveField(11)@JsonKey(name: "package_expiry") Object? get packageExpiry;@HiveField(12)@JsonKey(name: "created_at") String get createdAt;@HiveField(13)@JsonKey(name: "updated_at") String get updatedAt;@HiveField(14)@JsonKey(name: "date_of_birth") String? get dateOfBirth;@HiveField(15)@JsonKey(name: "phone_number") String? get phoneNumber;@HiveField(16)@JsonKey(name: "patient_card_number") String? get patientCardNumber;@HiveField(17)@JsonKey(name: "national_number") String? get nationalNumber;@HiveField(18)@JsonKey(name: "secretary_id") int? get secretaryId;@HiveField(19)@JsonKey(name: "receptionist_id") int? get receptionistId;@HiveField(20)@JsonKey(name: "medical_biller_id") int? get medicalBillerId;@HiveField(21)@JsonKey(name: "weight") Object? get weight;@HiveField(22)@JsonKey(name: "height") Object? get height;@HiveField(23)@JsonKey(name: "occupation") String? get occupation;@HiveField(24)@JsonKey(name: "payment") Object? get payment;@HiveField(25)@JsonKey(name: "gender") String? get gender;@HiveField(26)@JsonKey(name: "refferal") String? get refferal;@HiveField(27)@JsonKey(name: "profile_pic") String? get profilePic;@HiveField(28)@JsonKey(name: "physiotherapist_id") int? get physiotherapistId;@HiveField(29)@JsonKey(name: "db_name") String? get dbName;@HiveField(30)@JsonKey(name: "db_username") String? get dbUsername;@HiveField(31)@JsonKey(name: "db_password") String? get dbPassword;@HiveField(32)@JsonKey(name: "hospital_id") String? get hospitalId;@HiveField(33)@JsonKey(name: "is_erp") int get isErp;@HiveField(34)@JsonKey(name: "medical_type") String? get medicalType;@HiveField(35)@JsonKey(name: "patient_erp_id") String? get patientErpId;@HiveField(36)@JsonKey(name: "tpa_id") int? get tpaId;@HiveField(37)@JsonKey(name: "full_name") String get fullName;
/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<AuthUserModel> get copyWith => _$AuthUserModelCopyWithImpl<AuthUserModel>(this as AuthUserModel, _$identity);

  /// Serializes this AuthUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.thirdName, thirdName) || other.thirdName == thirdName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.email, email) || other.email == email)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.verificationCode, verificationCode) || other.verificationCode == verificationCode)&&const DeepCollectionEquality().equals(other.userVerified, userVerified)&&const DeepCollectionEquality().equals(other.packageExpiry, packageExpiry)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.patientCardNumber, patientCardNumber) || other.patientCardNumber == patientCardNumber)&&(identical(other.nationalNumber, nationalNumber) || other.nationalNumber == nationalNumber)&&(identical(other.secretaryId, secretaryId) || other.secretaryId == secretaryId)&&(identical(other.receptionistId, receptionistId) || other.receptionistId == receptionistId)&&(identical(other.medicalBillerId, medicalBillerId) || other.medicalBillerId == medicalBillerId)&&const DeepCollectionEquality().equals(other.weight, weight)&&const DeepCollectionEquality().equals(other.height, height)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&const DeepCollectionEquality().equals(other.payment, payment)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.refferal, refferal) || other.refferal == refferal)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.physiotherapistId, physiotherapistId) || other.physiotherapistId == physiotherapistId)&&(identical(other.dbName, dbName) || other.dbName == dbName)&&(identical(other.dbUsername, dbUsername) || other.dbUsername == dbUsername)&&(identical(other.dbPassword, dbPassword) || other.dbPassword == dbPassword)&&(identical(other.hospitalId, hospitalId) || other.hospitalId == hospitalId)&&(identical(other.isErp, isErp) || other.isErp == isErp)&&(identical(other.medicalType, medicalType) || other.medicalType == medicalType)&&(identical(other.patientErpId, patientErpId) || other.patientErpId == patientErpId)&&(identical(other.tpaId, tpaId) || other.tpaId == tpaId)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,secondName,thirdName,lastName,slug,email,locationId,verificationCode,const DeepCollectionEquality().hash(userVerified),const DeepCollectionEquality().hash(packageExpiry),createdAt,updatedAt,dateOfBirth,phoneNumber,patientCardNumber,nationalNumber,secretaryId,receptionistId,medicalBillerId,const DeepCollectionEquality().hash(weight),const DeepCollectionEquality().hash(height),occupation,const DeepCollectionEquality().hash(payment),gender,refferal,profilePic,physiotherapistId,dbName,dbUsername,dbPassword,hospitalId,isErp,medicalType,patientErpId,tpaId,fullName]);

@override
String toString() {
  return 'AuthUserModel(id: $id, firstName: $firstName, secondName: $secondName, thirdName: $thirdName, lastName: $lastName, slug: $slug, email: $email, locationId: $locationId, verificationCode: $verificationCode, userVerified: $userVerified, packageExpiry: $packageExpiry, createdAt: $createdAt, updatedAt: $updatedAt, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, patientCardNumber: $patientCardNumber, nationalNumber: $nationalNumber, secretaryId: $secretaryId, receptionistId: $receptionistId, medicalBillerId: $medicalBillerId, weight: $weight, height: $height, occupation: $occupation, payment: $payment, gender: $gender, refferal: $refferal, profilePic: $profilePic, physiotherapistId: $physiotherapistId, dbName: $dbName, dbUsername: $dbUsername, dbPassword: $dbPassword, hospitalId: $hospitalId, isErp: $isErp, medicalType: $medicalType, patientErpId: $patientErpId, tpaId: $tpaId, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $AuthUserModelCopyWith<$Res>  {
  factory $AuthUserModelCopyWith(AuthUserModel value, $Res Function(AuthUserModel) _then) = _$AuthUserModelCopyWithImpl;
@useResult
$Res call({
@HiveField(1)@JsonKey(name: "id") int id,@HiveField(2)@JsonKey(name: "first_name") String firstName,@HiveField(3)@JsonKey(name: "second_name") String? secondName,@HiveField(4)@JsonKey(name: "third_name") String? thirdName,@HiveField(5)@JsonKey(name: "last_name") String lastName,@HiveField(6)@JsonKey(name: "slug") String slug,@HiveField(7)@JsonKey(name: "email") String email,@HiveField(8)@JsonKey(name: "location_id") int? locationId,@HiveField(9)@JsonKey(name: "verification_code") String? verificationCode,@HiveField(10)@JsonKey(name: "user_verified") Object? userVerified,@HiveField(11)@JsonKey(name: "package_expiry") Object? packageExpiry,@HiveField(12)@JsonKey(name: "created_at") String createdAt,@HiveField(13)@JsonKey(name: "updated_at") String updatedAt,@HiveField(14)@JsonKey(name: "date_of_birth") String? dateOfBirth,@HiveField(15)@JsonKey(name: "phone_number") String? phoneNumber,@HiveField(16)@JsonKey(name: "patient_card_number") String? patientCardNumber,@HiveField(17)@JsonKey(name: "national_number") String? nationalNumber,@HiveField(18)@JsonKey(name: "secretary_id") int? secretaryId,@HiveField(19)@JsonKey(name: "receptionist_id") int? receptionistId,@HiveField(20)@JsonKey(name: "medical_biller_id") int? medicalBillerId,@HiveField(21)@JsonKey(name: "weight") Object? weight,@HiveField(22)@JsonKey(name: "height") Object? height,@HiveField(23)@JsonKey(name: "occupation") String? occupation,@HiveField(24)@JsonKey(name: "payment") Object? payment,@HiveField(25)@JsonKey(name: "gender") String? gender,@HiveField(26)@JsonKey(name: "refferal") String? refferal,@HiveField(27)@JsonKey(name: "profile_pic") String? profilePic,@HiveField(28)@JsonKey(name: "physiotherapist_id") int? physiotherapistId,@HiveField(29)@JsonKey(name: "db_name") String? dbName,@HiveField(30)@JsonKey(name: "db_username") String? dbUsername,@HiveField(31)@JsonKey(name: "db_password") String? dbPassword,@HiveField(32)@JsonKey(name: "hospital_id") String? hospitalId,@HiveField(33)@JsonKey(name: "is_erp") int isErp,@HiveField(34)@JsonKey(name: "medical_type") String? medicalType,@HiveField(35)@JsonKey(name: "patient_erp_id") String? patientErpId,@HiveField(36)@JsonKey(name: "tpa_id") int? tpaId,@HiveField(37)@JsonKey(name: "full_name") String fullName
});




}
/// @nodoc
class _$AuthUserModelCopyWithImpl<$Res>
    implements $AuthUserModelCopyWith<$Res> {
  _$AuthUserModelCopyWithImpl(this._self, this._then);

  final AuthUserModel _self;
  final $Res Function(AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? secondName = freezed,Object? thirdName = freezed,Object? lastName = null,Object? slug = null,Object? email = null,Object? locationId = freezed,Object? verificationCode = freezed,Object? userVerified = freezed,Object? packageExpiry = freezed,Object? createdAt = null,Object? updatedAt = null,Object? dateOfBirth = freezed,Object? phoneNumber = freezed,Object? patientCardNumber = freezed,Object? nationalNumber = freezed,Object? secretaryId = freezed,Object? receptionistId = freezed,Object? medicalBillerId = freezed,Object? weight = freezed,Object? height = freezed,Object? occupation = freezed,Object? payment = freezed,Object? gender = freezed,Object? refferal = freezed,Object? profilePic = freezed,Object? physiotherapistId = freezed,Object? dbName = freezed,Object? dbUsername = freezed,Object? dbPassword = freezed,Object? hospitalId = freezed,Object? isErp = null,Object? medicalType = freezed,Object? patientErpId = freezed,Object? tpaId = freezed,Object? fullName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,secondName: freezed == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String?,thirdName: freezed == thirdName ? _self.thirdName : thirdName // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,verificationCode: freezed == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String?,userVerified: freezed == userVerified ? _self.userVerified : userVerified ,packageExpiry: freezed == packageExpiry ? _self.packageExpiry : packageExpiry ,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,patientCardNumber: freezed == patientCardNumber ? _self.patientCardNumber : patientCardNumber // ignore: cast_nullable_to_non_nullable
as String?,nationalNumber: freezed == nationalNumber ? _self.nationalNumber : nationalNumber // ignore: cast_nullable_to_non_nullable
as String?,secretaryId: freezed == secretaryId ? _self.secretaryId : secretaryId // ignore: cast_nullable_to_non_nullable
as int?,receptionistId: freezed == receptionistId ? _self.receptionistId : receptionistId // ignore: cast_nullable_to_non_nullable
as int?,medicalBillerId: freezed == medicalBillerId ? _self.medicalBillerId : medicalBillerId // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight ,height: freezed == height ? _self.height : height ,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,payment: freezed == payment ? _self.payment : payment ,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,refferal: freezed == refferal ? _self.refferal : refferal // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,physiotherapistId: freezed == physiotherapistId ? _self.physiotherapistId : physiotherapistId // ignore: cast_nullable_to_non_nullable
as int?,dbName: freezed == dbName ? _self.dbName : dbName // ignore: cast_nullable_to_non_nullable
as String?,dbUsername: freezed == dbUsername ? _self.dbUsername : dbUsername // ignore: cast_nullable_to_non_nullable
as String?,dbPassword: freezed == dbPassword ? _self.dbPassword : dbPassword // ignore: cast_nullable_to_non_nullable
as String?,hospitalId: freezed == hospitalId ? _self.hospitalId : hospitalId // ignore: cast_nullable_to_non_nullable
as String?,isErp: null == isErp ? _self.isErp : isErp // ignore: cast_nullable_to_non_nullable
as int,medicalType: freezed == medicalType ? _self.medicalType : medicalType // ignore: cast_nullable_to_non_nullable
as String?,patientErpId: freezed == patientErpId ? _self.patientErpId : patientErpId // ignore: cast_nullable_to_non_nullable
as String?,tpaId: freezed == tpaId ? _self.tpaId : tpaId // ignore: cast_nullable_to_non_nullable
as int?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUserModel].
extension AuthUserModelPatterns on AuthUserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUserModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthUserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(1)@JsonKey(name: "id")  int id, @HiveField(2)@JsonKey(name: "first_name")  String firstName, @HiveField(3)@JsonKey(name: "second_name")  String? secondName, @HiveField(4)@JsonKey(name: "third_name")  String? thirdName, @HiveField(5)@JsonKey(name: "last_name")  String lastName, @HiveField(6)@JsonKey(name: "slug")  String slug, @HiveField(7)@JsonKey(name: "email")  String email, @HiveField(8)@JsonKey(name: "location_id")  int? locationId, @HiveField(9)@JsonKey(name: "verification_code")  String? verificationCode, @HiveField(10)@JsonKey(name: "user_verified")  Object? userVerified, @HiveField(11)@JsonKey(name: "package_expiry")  Object? packageExpiry, @HiveField(12)@JsonKey(name: "created_at")  String createdAt, @HiveField(13)@JsonKey(name: "updated_at")  String updatedAt, @HiveField(14)@JsonKey(name: "date_of_birth")  String? dateOfBirth, @HiveField(15)@JsonKey(name: "phone_number")  String? phoneNumber, @HiveField(16)@JsonKey(name: "patient_card_number")  String? patientCardNumber, @HiveField(17)@JsonKey(name: "national_number")  String? nationalNumber, @HiveField(18)@JsonKey(name: "secretary_id")  int? secretaryId, @HiveField(19)@JsonKey(name: "receptionist_id")  int? receptionistId, @HiveField(20)@JsonKey(name: "medical_biller_id")  int? medicalBillerId, @HiveField(21)@JsonKey(name: "weight")  Object? weight, @HiveField(22)@JsonKey(name: "height")  Object? height, @HiveField(23)@JsonKey(name: "occupation")  String? occupation, @HiveField(24)@JsonKey(name: "payment")  Object? payment, @HiveField(25)@JsonKey(name: "gender")  String? gender, @HiveField(26)@JsonKey(name: "refferal")  String? refferal, @HiveField(27)@JsonKey(name: "profile_pic")  String? profilePic, @HiveField(28)@JsonKey(name: "physiotherapist_id")  int? physiotherapistId, @HiveField(29)@JsonKey(name: "db_name")  String? dbName, @HiveField(30)@JsonKey(name: "db_username")  String? dbUsername, @HiveField(31)@JsonKey(name: "db_password")  String? dbPassword, @HiveField(32)@JsonKey(name: "hospital_id")  String? hospitalId, @HiveField(33)@JsonKey(name: "is_erp")  int isErp, @HiveField(34)@JsonKey(name: "medical_type")  String? medicalType, @HiveField(35)@JsonKey(name: "patient_erp_id")  String? patientErpId, @HiveField(36)@JsonKey(name: "tpa_id")  int? tpaId, @HiveField(37)@JsonKey(name: "full_name")  String fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.secondName,_that.thirdName,_that.lastName,_that.slug,_that.email,_that.locationId,_that.verificationCode,_that.userVerified,_that.packageExpiry,_that.createdAt,_that.updatedAt,_that.dateOfBirth,_that.phoneNumber,_that.patientCardNumber,_that.nationalNumber,_that.secretaryId,_that.receptionistId,_that.medicalBillerId,_that.weight,_that.height,_that.occupation,_that.payment,_that.gender,_that.refferal,_that.profilePic,_that.physiotherapistId,_that.dbName,_that.dbUsername,_that.dbPassword,_that.hospitalId,_that.isErp,_that.medicalType,_that.patientErpId,_that.tpaId,_that.fullName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(1)@JsonKey(name: "id")  int id, @HiveField(2)@JsonKey(name: "first_name")  String firstName, @HiveField(3)@JsonKey(name: "second_name")  String? secondName, @HiveField(4)@JsonKey(name: "third_name")  String? thirdName, @HiveField(5)@JsonKey(name: "last_name")  String lastName, @HiveField(6)@JsonKey(name: "slug")  String slug, @HiveField(7)@JsonKey(name: "email")  String email, @HiveField(8)@JsonKey(name: "location_id")  int? locationId, @HiveField(9)@JsonKey(name: "verification_code")  String? verificationCode, @HiveField(10)@JsonKey(name: "user_verified")  Object? userVerified, @HiveField(11)@JsonKey(name: "package_expiry")  Object? packageExpiry, @HiveField(12)@JsonKey(name: "created_at")  String createdAt, @HiveField(13)@JsonKey(name: "updated_at")  String updatedAt, @HiveField(14)@JsonKey(name: "date_of_birth")  String? dateOfBirth, @HiveField(15)@JsonKey(name: "phone_number")  String? phoneNumber, @HiveField(16)@JsonKey(name: "patient_card_number")  String? patientCardNumber, @HiveField(17)@JsonKey(name: "national_number")  String? nationalNumber, @HiveField(18)@JsonKey(name: "secretary_id")  int? secretaryId, @HiveField(19)@JsonKey(name: "receptionist_id")  int? receptionistId, @HiveField(20)@JsonKey(name: "medical_biller_id")  int? medicalBillerId, @HiveField(21)@JsonKey(name: "weight")  Object? weight, @HiveField(22)@JsonKey(name: "height")  Object? height, @HiveField(23)@JsonKey(name: "occupation")  String? occupation, @HiveField(24)@JsonKey(name: "payment")  Object? payment, @HiveField(25)@JsonKey(name: "gender")  String? gender, @HiveField(26)@JsonKey(name: "refferal")  String? refferal, @HiveField(27)@JsonKey(name: "profile_pic")  String? profilePic, @HiveField(28)@JsonKey(name: "physiotherapist_id")  int? physiotherapistId, @HiveField(29)@JsonKey(name: "db_name")  String? dbName, @HiveField(30)@JsonKey(name: "db_username")  String? dbUsername, @HiveField(31)@JsonKey(name: "db_password")  String? dbPassword, @HiveField(32)@JsonKey(name: "hospital_id")  String? hospitalId, @HiveField(33)@JsonKey(name: "is_erp")  int isErp, @HiveField(34)@JsonKey(name: "medical_type")  String? medicalType, @HiveField(35)@JsonKey(name: "patient_erp_id")  String? patientErpId, @HiveField(36)@JsonKey(name: "tpa_id")  int? tpaId, @HiveField(37)@JsonKey(name: "full_name")  String fullName)  $default,) {final _that = this;
switch (_that) {
case _AuthUserModel():
return $default(_that.id,_that.firstName,_that.secondName,_that.thirdName,_that.lastName,_that.slug,_that.email,_that.locationId,_that.verificationCode,_that.userVerified,_that.packageExpiry,_that.createdAt,_that.updatedAt,_that.dateOfBirth,_that.phoneNumber,_that.patientCardNumber,_that.nationalNumber,_that.secretaryId,_that.receptionistId,_that.medicalBillerId,_that.weight,_that.height,_that.occupation,_that.payment,_that.gender,_that.refferal,_that.profilePic,_that.physiotherapistId,_that.dbName,_that.dbUsername,_that.dbPassword,_that.hospitalId,_that.isErp,_that.medicalType,_that.patientErpId,_that.tpaId,_that.fullName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(1)@JsonKey(name: "id")  int id, @HiveField(2)@JsonKey(name: "first_name")  String firstName, @HiveField(3)@JsonKey(name: "second_name")  String? secondName, @HiveField(4)@JsonKey(name: "third_name")  String? thirdName, @HiveField(5)@JsonKey(name: "last_name")  String lastName, @HiveField(6)@JsonKey(name: "slug")  String slug, @HiveField(7)@JsonKey(name: "email")  String email, @HiveField(8)@JsonKey(name: "location_id")  int? locationId, @HiveField(9)@JsonKey(name: "verification_code")  String? verificationCode, @HiveField(10)@JsonKey(name: "user_verified")  Object? userVerified, @HiveField(11)@JsonKey(name: "package_expiry")  Object? packageExpiry, @HiveField(12)@JsonKey(name: "created_at")  String createdAt, @HiveField(13)@JsonKey(name: "updated_at")  String updatedAt, @HiveField(14)@JsonKey(name: "date_of_birth")  String? dateOfBirth, @HiveField(15)@JsonKey(name: "phone_number")  String? phoneNumber, @HiveField(16)@JsonKey(name: "patient_card_number")  String? patientCardNumber, @HiveField(17)@JsonKey(name: "national_number")  String? nationalNumber, @HiveField(18)@JsonKey(name: "secretary_id")  int? secretaryId, @HiveField(19)@JsonKey(name: "receptionist_id")  int? receptionistId, @HiveField(20)@JsonKey(name: "medical_biller_id")  int? medicalBillerId, @HiveField(21)@JsonKey(name: "weight")  Object? weight, @HiveField(22)@JsonKey(name: "height")  Object? height, @HiveField(23)@JsonKey(name: "occupation")  String? occupation, @HiveField(24)@JsonKey(name: "payment")  Object? payment, @HiveField(25)@JsonKey(name: "gender")  String? gender, @HiveField(26)@JsonKey(name: "refferal")  String? refferal, @HiveField(27)@JsonKey(name: "profile_pic")  String? profilePic, @HiveField(28)@JsonKey(name: "physiotherapist_id")  int? physiotherapistId, @HiveField(29)@JsonKey(name: "db_name")  String? dbName, @HiveField(30)@JsonKey(name: "db_username")  String? dbUsername, @HiveField(31)@JsonKey(name: "db_password")  String? dbPassword, @HiveField(32)@JsonKey(name: "hospital_id")  String? hospitalId, @HiveField(33)@JsonKey(name: "is_erp")  int isErp, @HiveField(34)@JsonKey(name: "medical_type")  String? medicalType, @HiveField(35)@JsonKey(name: "patient_erp_id")  String? patientErpId, @HiveField(36)@JsonKey(name: "tpa_id")  int? tpaId, @HiveField(37)@JsonKey(name: "full_name")  String fullName)?  $default,) {final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.secondName,_that.thirdName,_that.lastName,_that.slug,_that.email,_that.locationId,_that.verificationCode,_that.userVerified,_that.packageExpiry,_that.createdAt,_that.updatedAt,_that.dateOfBirth,_that.phoneNumber,_that.patientCardNumber,_that.nationalNumber,_that.secretaryId,_that.receptionistId,_that.medicalBillerId,_that.weight,_that.height,_that.occupation,_that.payment,_that.gender,_that.refferal,_that.profilePic,_that.physiotherapistId,_that.dbName,_that.dbUsername,_that.dbPassword,_that.hospitalId,_that.isErp,_that.medicalType,_that.patientErpId,_that.tpaId,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 100, adapterName: 'AuthUserModelAdapter')
class _AuthUserModel implements AuthUserModel {
  const _AuthUserModel({@HiveField(1)@JsonKey(name: "id") required this.id, @HiveField(2)@JsonKey(name: "first_name") required this.firstName, @HiveField(3)@JsonKey(name: "second_name") this.secondName, @HiveField(4)@JsonKey(name: "third_name") this.thirdName, @HiveField(5)@JsonKey(name: "last_name") required this.lastName, @HiveField(6)@JsonKey(name: "slug") required this.slug, @HiveField(7)@JsonKey(name: "email") required this.email, @HiveField(8)@JsonKey(name: "location_id") this.locationId, @HiveField(9)@JsonKey(name: "verification_code") this.verificationCode, @HiveField(10)@JsonKey(name: "user_verified") this.userVerified, @HiveField(11)@JsonKey(name: "package_expiry") this.packageExpiry, @HiveField(12)@JsonKey(name: "created_at") required this.createdAt, @HiveField(13)@JsonKey(name: "updated_at") required this.updatedAt, @HiveField(14)@JsonKey(name: "date_of_birth") this.dateOfBirth, @HiveField(15)@JsonKey(name: "phone_number") this.phoneNumber, @HiveField(16)@JsonKey(name: "patient_card_number") this.patientCardNumber, @HiveField(17)@JsonKey(name: "national_number") this.nationalNumber, @HiveField(18)@JsonKey(name: "secretary_id") this.secretaryId, @HiveField(19)@JsonKey(name: "receptionist_id") this.receptionistId, @HiveField(20)@JsonKey(name: "medical_biller_id") this.medicalBillerId, @HiveField(21)@JsonKey(name: "weight") this.weight, @HiveField(22)@JsonKey(name: "height") this.height, @HiveField(23)@JsonKey(name: "occupation") this.occupation, @HiveField(24)@JsonKey(name: "payment") this.payment, @HiveField(25)@JsonKey(name: "gender") this.gender, @HiveField(26)@JsonKey(name: "refferal") this.refferal, @HiveField(27)@JsonKey(name: "profile_pic") this.profilePic, @HiveField(28)@JsonKey(name: "physiotherapist_id") this.physiotherapistId, @HiveField(29)@JsonKey(name: "db_name") this.dbName, @HiveField(30)@JsonKey(name: "db_username") this.dbUsername, @HiveField(31)@JsonKey(name: "db_password") this.dbPassword, @HiveField(32)@JsonKey(name: "hospital_id") this.hospitalId, @HiveField(33)@JsonKey(name: "is_erp") required this.isErp, @HiveField(34)@JsonKey(name: "medical_type") this.medicalType, @HiveField(35)@JsonKey(name: "patient_erp_id") this.patientErpId, @HiveField(36)@JsonKey(name: "tpa_id") this.tpaId, @HiveField(37)@JsonKey(name: "full_name") required this.fullName});
  factory _AuthUserModel.fromJson(Map<String, dynamic> json) => _$AuthUserModelFromJson(json);

@override@HiveField(1)@JsonKey(name: "id") final  int id;
@override@HiveField(2)@JsonKey(name: "first_name") final  String firstName;
@override@HiveField(3)@JsonKey(name: "second_name") final  String? secondName;
@override@HiveField(4)@JsonKey(name: "third_name") final  String? thirdName;
@override@HiveField(5)@JsonKey(name: "last_name") final  String lastName;
@override@HiveField(6)@JsonKey(name: "slug") final  String slug;
@override@HiveField(7)@JsonKey(name: "email") final  String email;
@override@HiveField(8)@JsonKey(name: "location_id") final  int? locationId;
@override@HiveField(9)@JsonKey(name: "verification_code") final  String? verificationCode;
@override@HiveField(10)@JsonKey(name: "user_verified") final  Object? userVerified;
@override@HiveField(11)@JsonKey(name: "package_expiry") final  Object? packageExpiry;
@override@HiveField(12)@JsonKey(name: "created_at") final  String createdAt;
@override@HiveField(13)@JsonKey(name: "updated_at") final  String updatedAt;
@override@HiveField(14)@JsonKey(name: "date_of_birth") final  String? dateOfBirth;
@override@HiveField(15)@JsonKey(name: "phone_number") final  String? phoneNumber;
@override@HiveField(16)@JsonKey(name: "patient_card_number") final  String? patientCardNumber;
@override@HiveField(17)@JsonKey(name: "national_number") final  String? nationalNumber;
@override@HiveField(18)@JsonKey(name: "secretary_id") final  int? secretaryId;
@override@HiveField(19)@JsonKey(name: "receptionist_id") final  int? receptionistId;
@override@HiveField(20)@JsonKey(name: "medical_biller_id") final  int? medicalBillerId;
@override@HiveField(21)@JsonKey(name: "weight") final  Object? weight;
@override@HiveField(22)@JsonKey(name: "height") final  Object? height;
@override@HiveField(23)@JsonKey(name: "occupation") final  String? occupation;
@override@HiveField(24)@JsonKey(name: "payment") final  Object? payment;
@override@HiveField(25)@JsonKey(name: "gender") final  String? gender;
@override@HiveField(26)@JsonKey(name: "refferal") final  String? refferal;
@override@HiveField(27)@JsonKey(name: "profile_pic") final  String? profilePic;
@override@HiveField(28)@JsonKey(name: "physiotherapist_id") final  int? physiotherapistId;
@override@HiveField(29)@JsonKey(name: "db_name") final  String? dbName;
@override@HiveField(30)@JsonKey(name: "db_username") final  String? dbUsername;
@override@HiveField(31)@JsonKey(name: "db_password") final  String? dbPassword;
@override@HiveField(32)@JsonKey(name: "hospital_id") final  String? hospitalId;
@override@HiveField(33)@JsonKey(name: "is_erp") final  int isErp;
@override@HiveField(34)@JsonKey(name: "medical_type") final  String? medicalType;
@override@HiveField(35)@JsonKey(name: "patient_erp_id") final  String? patientErpId;
@override@HiveField(36)@JsonKey(name: "tpa_id") final  int? tpaId;
@override@HiveField(37)@JsonKey(name: "full_name") final  String fullName;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserModelCopyWith<_AuthUserModel> get copyWith => __$AuthUserModelCopyWithImpl<_AuthUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.thirdName, thirdName) || other.thirdName == thirdName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.email, email) || other.email == email)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.verificationCode, verificationCode) || other.verificationCode == verificationCode)&&const DeepCollectionEquality().equals(other.userVerified, userVerified)&&const DeepCollectionEquality().equals(other.packageExpiry, packageExpiry)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.patientCardNumber, patientCardNumber) || other.patientCardNumber == patientCardNumber)&&(identical(other.nationalNumber, nationalNumber) || other.nationalNumber == nationalNumber)&&(identical(other.secretaryId, secretaryId) || other.secretaryId == secretaryId)&&(identical(other.receptionistId, receptionistId) || other.receptionistId == receptionistId)&&(identical(other.medicalBillerId, medicalBillerId) || other.medicalBillerId == medicalBillerId)&&const DeepCollectionEquality().equals(other.weight, weight)&&const DeepCollectionEquality().equals(other.height, height)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&const DeepCollectionEquality().equals(other.payment, payment)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.refferal, refferal) || other.refferal == refferal)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.physiotherapistId, physiotherapistId) || other.physiotherapistId == physiotherapistId)&&(identical(other.dbName, dbName) || other.dbName == dbName)&&(identical(other.dbUsername, dbUsername) || other.dbUsername == dbUsername)&&(identical(other.dbPassword, dbPassword) || other.dbPassword == dbPassword)&&(identical(other.hospitalId, hospitalId) || other.hospitalId == hospitalId)&&(identical(other.isErp, isErp) || other.isErp == isErp)&&(identical(other.medicalType, medicalType) || other.medicalType == medicalType)&&(identical(other.patientErpId, patientErpId) || other.patientErpId == patientErpId)&&(identical(other.tpaId, tpaId) || other.tpaId == tpaId)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,secondName,thirdName,lastName,slug,email,locationId,verificationCode,const DeepCollectionEquality().hash(userVerified),const DeepCollectionEquality().hash(packageExpiry),createdAt,updatedAt,dateOfBirth,phoneNumber,patientCardNumber,nationalNumber,secretaryId,receptionistId,medicalBillerId,const DeepCollectionEquality().hash(weight),const DeepCollectionEquality().hash(height),occupation,const DeepCollectionEquality().hash(payment),gender,refferal,profilePic,physiotherapistId,dbName,dbUsername,dbPassword,hospitalId,isErp,medicalType,patientErpId,tpaId,fullName]);

@override
String toString() {
  return 'AuthUserModel(id: $id, firstName: $firstName, secondName: $secondName, thirdName: $thirdName, lastName: $lastName, slug: $slug, email: $email, locationId: $locationId, verificationCode: $verificationCode, userVerified: $userVerified, packageExpiry: $packageExpiry, createdAt: $createdAt, updatedAt: $updatedAt, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, patientCardNumber: $patientCardNumber, nationalNumber: $nationalNumber, secretaryId: $secretaryId, receptionistId: $receptionistId, medicalBillerId: $medicalBillerId, weight: $weight, height: $height, occupation: $occupation, payment: $payment, gender: $gender, refferal: $refferal, profilePic: $profilePic, physiotherapistId: $physiotherapistId, dbName: $dbName, dbUsername: $dbUsername, dbPassword: $dbPassword, hospitalId: $hospitalId, isErp: $isErp, medicalType: $medicalType, patientErpId: $patientErpId, tpaId: $tpaId, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$AuthUserModelCopyWith<$Res> implements $AuthUserModelCopyWith<$Res> {
  factory _$AuthUserModelCopyWith(_AuthUserModel value, $Res Function(_AuthUserModel) _then) = __$AuthUserModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(1)@JsonKey(name: "id") int id,@HiveField(2)@JsonKey(name: "first_name") String firstName,@HiveField(3)@JsonKey(name: "second_name") String? secondName,@HiveField(4)@JsonKey(name: "third_name") String? thirdName,@HiveField(5)@JsonKey(name: "last_name") String lastName,@HiveField(6)@JsonKey(name: "slug") String slug,@HiveField(7)@JsonKey(name: "email") String email,@HiveField(8)@JsonKey(name: "location_id") int? locationId,@HiveField(9)@JsonKey(name: "verification_code") String? verificationCode,@HiveField(10)@JsonKey(name: "user_verified") Object? userVerified,@HiveField(11)@JsonKey(name: "package_expiry") Object? packageExpiry,@HiveField(12)@JsonKey(name: "created_at") String createdAt,@HiveField(13)@JsonKey(name: "updated_at") String updatedAt,@HiveField(14)@JsonKey(name: "date_of_birth") String? dateOfBirth,@HiveField(15)@JsonKey(name: "phone_number") String? phoneNumber,@HiveField(16)@JsonKey(name: "patient_card_number") String? patientCardNumber,@HiveField(17)@JsonKey(name: "national_number") String? nationalNumber,@HiveField(18)@JsonKey(name: "secretary_id") int? secretaryId,@HiveField(19)@JsonKey(name: "receptionist_id") int? receptionistId,@HiveField(20)@JsonKey(name: "medical_biller_id") int? medicalBillerId,@HiveField(21)@JsonKey(name: "weight") Object? weight,@HiveField(22)@JsonKey(name: "height") Object? height,@HiveField(23)@JsonKey(name: "occupation") String? occupation,@HiveField(24)@JsonKey(name: "payment") Object? payment,@HiveField(25)@JsonKey(name: "gender") String? gender,@HiveField(26)@JsonKey(name: "refferal") String? refferal,@HiveField(27)@JsonKey(name: "profile_pic") String? profilePic,@HiveField(28)@JsonKey(name: "physiotherapist_id") int? physiotherapistId,@HiveField(29)@JsonKey(name: "db_name") String? dbName,@HiveField(30)@JsonKey(name: "db_username") String? dbUsername,@HiveField(31)@JsonKey(name: "db_password") String? dbPassword,@HiveField(32)@JsonKey(name: "hospital_id") String? hospitalId,@HiveField(33)@JsonKey(name: "is_erp") int isErp,@HiveField(34)@JsonKey(name: "medical_type") String? medicalType,@HiveField(35)@JsonKey(name: "patient_erp_id") String? patientErpId,@HiveField(36)@JsonKey(name: "tpa_id") int? tpaId,@HiveField(37)@JsonKey(name: "full_name") String fullName
});




}
/// @nodoc
class __$AuthUserModelCopyWithImpl<$Res>
    implements _$AuthUserModelCopyWith<$Res> {
  __$AuthUserModelCopyWithImpl(this._self, this._then);

  final _AuthUserModel _self;
  final $Res Function(_AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? secondName = freezed,Object? thirdName = freezed,Object? lastName = null,Object? slug = null,Object? email = null,Object? locationId = freezed,Object? verificationCode = freezed,Object? userVerified = freezed,Object? packageExpiry = freezed,Object? createdAt = null,Object? updatedAt = null,Object? dateOfBirth = freezed,Object? phoneNumber = freezed,Object? patientCardNumber = freezed,Object? nationalNumber = freezed,Object? secretaryId = freezed,Object? receptionistId = freezed,Object? medicalBillerId = freezed,Object? weight = freezed,Object? height = freezed,Object? occupation = freezed,Object? payment = freezed,Object? gender = freezed,Object? refferal = freezed,Object? profilePic = freezed,Object? physiotherapistId = freezed,Object? dbName = freezed,Object? dbUsername = freezed,Object? dbPassword = freezed,Object? hospitalId = freezed,Object? isErp = null,Object? medicalType = freezed,Object? patientErpId = freezed,Object? tpaId = freezed,Object? fullName = null,}) {
  return _then(_AuthUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,secondName: freezed == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String?,thirdName: freezed == thirdName ? _self.thirdName : thirdName // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,verificationCode: freezed == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String?,userVerified: freezed == userVerified ? _self.userVerified : userVerified ,packageExpiry: freezed == packageExpiry ? _self.packageExpiry : packageExpiry ,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,patientCardNumber: freezed == patientCardNumber ? _self.patientCardNumber : patientCardNumber // ignore: cast_nullable_to_non_nullable
as String?,nationalNumber: freezed == nationalNumber ? _self.nationalNumber : nationalNumber // ignore: cast_nullable_to_non_nullable
as String?,secretaryId: freezed == secretaryId ? _self.secretaryId : secretaryId // ignore: cast_nullable_to_non_nullable
as int?,receptionistId: freezed == receptionistId ? _self.receptionistId : receptionistId // ignore: cast_nullable_to_non_nullable
as int?,medicalBillerId: freezed == medicalBillerId ? _self.medicalBillerId : medicalBillerId // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight ,height: freezed == height ? _self.height : height ,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,payment: freezed == payment ? _self.payment : payment ,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,refferal: freezed == refferal ? _self.refferal : refferal // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,physiotherapistId: freezed == physiotherapistId ? _self.physiotherapistId : physiotherapistId // ignore: cast_nullable_to_non_nullable
as int?,dbName: freezed == dbName ? _self.dbName : dbName // ignore: cast_nullable_to_non_nullable
as String?,dbUsername: freezed == dbUsername ? _self.dbUsername : dbUsername // ignore: cast_nullable_to_non_nullable
as String?,dbPassword: freezed == dbPassword ? _self.dbPassword : dbPassword // ignore: cast_nullable_to_non_nullable
as String?,hospitalId: freezed == hospitalId ? _self.hospitalId : hospitalId // ignore: cast_nullable_to_non_nullable
as String?,isErp: null == isErp ? _self.isErp : isErp // ignore: cast_nullable_to_non_nullable
as int,medicalType: freezed == medicalType ? _self.medicalType : medicalType // ignore: cast_nullable_to_non_nullable
as String?,patientErpId: freezed == patientErpId ? _self.patientErpId : patientErpId // ignore: cast_nullable_to_non_nullable
as String?,tpaId: freezed == tpaId ? _self.tpaId : tpaId // ignore: cast_nullable_to_non_nullable
as int?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
