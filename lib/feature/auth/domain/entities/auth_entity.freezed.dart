// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEntity {

 int get id; String get firstName; String? get secondName; String? get thirdName; String get lastName; String get slug; String get email; int get locationId; String? get verificationCode; dynamic get userVerified; dynamic get packageExpiry; String get createdAt; String get updatedAt; String? get dateOfBirth; String? get phoneNumber; String? get patientCardNumber; String? get nationalNumber; int? get secretaryId; int? get receptionistId; int? get medicalBillerId; dynamic get weight; dynamic get height; String? get occupation; dynamic get payment; String? get gender; String? get refferal; String? get profilePic; int? get physiotherapistId; String? get dbName; String? get dbUsername; String? get dbPassword; int? get hospitalId; int get isErp; String? get medicalType; String? get patientErpId; int? get tpaId; String get fullName;
/// Create a copy of AuthEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEntityCopyWith<AuthEntity> get copyWith => _$AuthEntityCopyWithImpl<AuthEntity>(this as AuthEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.thirdName, thirdName) || other.thirdName == thirdName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.email, email) || other.email == email)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.verificationCode, verificationCode) || other.verificationCode == verificationCode)&&const DeepCollectionEquality().equals(other.userVerified, userVerified)&&const DeepCollectionEquality().equals(other.packageExpiry, packageExpiry)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.patientCardNumber, patientCardNumber) || other.patientCardNumber == patientCardNumber)&&(identical(other.nationalNumber, nationalNumber) || other.nationalNumber == nationalNumber)&&(identical(other.secretaryId, secretaryId) || other.secretaryId == secretaryId)&&(identical(other.receptionistId, receptionistId) || other.receptionistId == receptionistId)&&(identical(other.medicalBillerId, medicalBillerId) || other.medicalBillerId == medicalBillerId)&&const DeepCollectionEquality().equals(other.weight, weight)&&const DeepCollectionEquality().equals(other.height, height)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&const DeepCollectionEquality().equals(other.payment, payment)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.refferal, refferal) || other.refferal == refferal)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.physiotherapistId, physiotherapistId) || other.physiotherapistId == physiotherapistId)&&(identical(other.dbName, dbName) || other.dbName == dbName)&&(identical(other.dbUsername, dbUsername) || other.dbUsername == dbUsername)&&(identical(other.dbPassword, dbPassword) || other.dbPassword == dbPassword)&&(identical(other.hospitalId, hospitalId) || other.hospitalId == hospitalId)&&(identical(other.isErp, isErp) || other.isErp == isErp)&&(identical(other.medicalType, medicalType) || other.medicalType == medicalType)&&(identical(other.patientErpId, patientErpId) || other.patientErpId == patientErpId)&&(identical(other.tpaId, tpaId) || other.tpaId == tpaId)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,secondName,thirdName,lastName,slug,email,locationId,verificationCode,const DeepCollectionEquality().hash(userVerified),const DeepCollectionEquality().hash(packageExpiry),createdAt,updatedAt,dateOfBirth,phoneNumber,patientCardNumber,nationalNumber,secretaryId,receptionistId,medicalBillerId,const DeepCollectionEquality().hash(weight),const DeepCollectionEquality().hash(height),occupation,const DeepCollectionEquality().hash(payment),gender,refferal,profilePic,physiotherapistId,dbName,dbUsername,dbPassword,hospitalId,isErp,medicalType,patientErpId,tpaId,fullName]);

@override
String toString() {
  return 'AuthEntity(id: $id, firstName: $firstName, secondName: $secondName, thirdName: $thirdName, lastName: $lastName, slug: $slug, email: $email, locationId: $locationId, verificationCode: $verificationCode, userVerified: $userVerified, packageExpiry: $packageExpiry, createdAt: $createdAt, updatedAt: $updatedAt, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, patientCardNumber: $patientCardNumber, nationalNumber: $nationalNumber, secretaryId: $secretaryId, receptionistId: $receptionistId, medicalBillerId: $medicalBillerId, weight: $weight, height: $height, occupation: $occupation, payment: $payment, gender: $gender, refferal: $refferal, profilePic: $profilePic, physiotherapistId: $physiotherapistId, dbName: $dbName, dbUsername: $dbUsername, dbPassword: $dbPassword, hospitalId: $hospitalId, isErp: $isErp, medicalType: $medicalType, patientErpId: $patientErpId, tpaId: $tpaId, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $AuthEntityCopyWith<$Res>  {
  factory $AuthEntityCopyWith(AuthEntity value, $Res Function(AuthEntity) _then) = _$AuthEntityCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String? secondName, String? thirdName, String lastName, String slug, String email, int locationId, String? verificationCode, dynamic userVerified, dynamic packageExpiry, String createdAt, String updatedAt, String? dateOfBirth, String? phoneNumber, String? patientCardNumber, String? nationalNumber, int? secretaryId, int? receptionistId, int? medicalBillerId, dynamic weight, dynamic height, String? occupation, dynamic payment, String? gender, String? refferal, String? profilePic, int? physiotherapistId, String? dbName, String? dbUsername, String? dbPassword, int? hospitalId, int isErp, String? medicalType, String? patientErpId, int? tpaId, String fullName
});




}
/// @nodoc
class _$AuthEntityCopyWithImpl<$Res>
    implements $AuthEntityCopyWith<$Res> {
  _$AuthEntityCopyWithImpl(this._self, this._then);

  final AuthEntity _self;
  final $Res Function(AuthEntity) _then;

/// Create a copy of AuthEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? secondName = freezed,Object? thirdName = freezed,Object? lastName = null,Object? slug = null,Object? email = null,Object? locationId = null,Object? verificationCode = freezed,Object? userVerified = freezed,Object? packageExpiry = freezed,Object? createdAt = null,Object? updatedAt = null,Object? dateOfBirth = freezed,Object? phoneNumber = freezed,Object? patientCardNumber = freezed,Object? nationalNumber = freezed,Object? secretaryId = freezed,Object? receptionistId = freezed,Object? medicalBillerId = freezed,Object? weight = freezed,Object? height = freezed,Object? occupation = freezed,Object? payment = freezed,Object? gender = freezed,Object? refferal = freezed,Object? profilePic = freezed,Object? physiotherapistId = freezed,Object? dbName = freezed,Object? dbUsername = freezed,Object? dbPassword = freezed,Object? hospitalId = freezed,Object? isErp = null,Object? medicalType = freezed,Object? patientErpId = freezed,Object? tpaId = freezed,Object? fullName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,secondName: freezed == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String?,thirdName: freezed == thirdName ? _self.thirdName : thirdName // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,verificationCode: freezed == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String?,userVerified: freezed == userVerified ? _self.userVerified : userVerified // ignore: cast_nullable_to_non_nullable
as dynamic,packageExpiry: freezed == packageExpiry ? _self.packageExpiry : packageExpiry // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,patientCardNumber: freezed == patientCardNumber ? _self.patientCardNumber : patientCardNumber // ignore: cast_nullable_to_non_nullable
as String?,nationalNumber: freezed == nationalNumber ? _self.nationalNumber : nationalNumber // ignore: cast_nullable_to_non_nullable
as String?,secretaryId: freezed == secretaryId ? _self.secretaryId : secretaryId // ignore: cast_nullable_to_non_nullable
as int?,receptionistId: freezed == receptionistId ? _self.receptionistId : receptionistId // ignore: cast_nullable_to_non_nullable
as int?,medicalBillerId: freezed == medicalBillerId ? _self.medicalBillerId : medicalBillerId // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as dynamic,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as dynamic,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as dynamic,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,refferal: freezed == refferal ? _self.refferal : refferal // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,physiotherapistId: freezed == physiotherapistId ? _self.physiotherapistId : physiotherapistId // ignore: cast_nullable_to_non_nullable
as int?,dbName: freezed == dbName ? _self.dbName : dbName // ignore: cast_nullable_to_non_nullable
as String?,dbUsername: freezed == dbUsername ? _self.dbUsername : dbUsername // ignore: cast_nullable_to_non_nullable
as String?,dbPassword: freezed == dbPassword ? _self.dbPassword : dbPassword // ignore: cast_nullable_to_non_nullable
as String?,hospitalId: freezed == hospitalId ? _self.hospitalId : hospitalId // ignore: cast_nullable_to_non_nullable
as int?,isErp: null == isErp ? _self.isErp : isErp // ignore: cast_nullable_to_non_nullable
as int,medicalType: freezed == medicalType ? _self.medicalType : medicalType // ignore: cast_nullable_to_non_nullable
as String?,patientErpId: freezed == patientErpId ? _self.patientErpId : patientErpId // ignore: cast_nullable_to_non_nullable
as String?,tpaId: freezed == tpaId ? _self.tpaId : tpaId // ignore: cast_nullable_to_non_nullable
as int?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthEntity].
extension AuthEntityPatterns on AuthEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthEntity value)  $default,){
final _that = this;
switch (_that) {
case _AuthEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AuthEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String? secondName,  String? thirdName,  String lastName,  String slug,  String email,  int locationId,  String? verificationCode,  dynamic userVerified,  dynamic packageExpiry,  String createdAt,  String updatedAt,  String? dateOfBirth,  String? phoneNumber,  String? patientCardNumber,  String? nationalNumber,  int? secretaryId,  int? receptionistId,  int? medicalBillerId,  dynamic weight,  dynamic height,  String? occupation,  dynamic payment,  String? gender,  String? refferal,  String? profilePic,  int? physiotherapistId,  String? dbName,  String? dbUsername,  String? dbPassword,  int? hospitalId,  int isErp,  String? medicalType,  String? patientErpId,  int? tpaId,  String fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String? secondName,  String? thirdName,  String lastName,  String slug,  String email,  int locationId,  String? verificationCode,  dynamic userVerified,  dynamic packageExpiry,  String createdAt,  String updatedAt,  String? dateOfBirth,  String? phoneNumber,  String? patientCardNumber,  String? nationalNumber,  int? secretaryId,  int? receptionistId,  int? medicalBillerId,  dynamic weight,  dynamic height,  String? occupation,  dynamic payment,  String? gender,  String? refferal,  String? profilePic,  int? physiotherapistId,  String? dbName,  String? dbUsername,  String? dbPassword,  int? hospitalId,  int isErp,  String? medicalType,  String? patientErpId,  int? tpaId,  String fullName)  $default,) {final _that = this;
switch (_that) {
case _AuthEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String? secondName,  String? thirdName,  String lastName,  String slug,  String email,  int locationId,  String? verificationCode,  dynamic userVerified,  dynamic packageExpiry,  String createdAt,  String updatedAt,  String? dateOfBirth,  String? phoneNumber,  String? patientCardNumber,  String? nationalNumber,  int? secretaryId,  int? receptionistId,  int? medicalBillerId,  dynamic weight,  dynamic height,  String? occupation,  dynamic payment,  String? gender,  String? refferal,  String? profilePic,  int? physiotherapistId,  String? dbName,  String? dbUsername,  String? dbPassword,  int? hospitalId,  int isErp,  String? medicalType,  String? patientErpId,  int? tpaId,  String fullName)?  $default,) {final _that = this;
switch (_that) {
case _AuthEntity() when $default != null:
return $default(_that.id,_that.firstName,_that.secondName,_that.thirdName,_that.lastName,_that.slug,_that.email,_that.locationId,_that.verificationCode,_that.userVerified,_that.packageExpiry,_that.createdAt,_that.updatedAt,_that.dateOfBirth,_that.phoneNumber,_that.patientCardNumber,_that.nationalNumber,_that.secretaryId,_that.receptionistId,_that.medicalBillerId,_that.weight,_that.height,_that.occupation,_that.payment,_that.gender,_that.refferal,_that.profilePic,_that.physiotherapistId,_that.dbName,_that.dbUsername,_that.dbPassword,_that.hospitalId,_that.isErp,_that.medicalType,_that.patientErpId,_that.tpaId,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc


class _AuthEntity implements AuthEntity {
  const _AuthEntity({required this.id, required this.firstName, this.secondName, this.thirdName, required this.lastName, required this.slug, required this.email, required this.locationId, this.verificationCode, this.userVerified, this.packageExpiry, required this.createdAt, required this.updatedAt, this.dateOfBirth, this.phoneNumber, this.patientCardNumber, this.nationalNumber, this.secretaryId, this.receptionistId, this.medicalBillerId, this.weight, this.height, this.occupation, this.payment, this.gender, this.refferal, this.profilePic, this.physiotherapistId, this.dbName, this.dbUsername, this.dbPassword, this.hospitalId, required this.isErp, this.medicalType, this.patientErpId, this.tpaId, required this.fullName});
  

@override final  int id;
@override final  String firstName;
@override final  String? secondName;
@override final  String? thirdName;
@override final  String lastName;
@override final  String slug;
@override final  String email;
@override final  int locationId;
@override final  String? verificationCode;
@override final  dynamic userVerified;
@override final  dynamic packageExpiry;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? dateOfBirth;
@override final  String? phoneNumber;
@override final  String? patientCardNumber;
@override final  String? nationalNumber;
@override final  int? secretaryId;
@override final  int? receptionistId;
@override final  int? medicalBillerId;
@override final  dynamic weight;
@override final  dynamic height;
@override final  String? occupation;
@override final  dynamic payment;
@override final  String? gender;
@override final  String? refferal;
@override final  String? profilePic;
@override final  int? physiotherapistId;
@override final  String? dbName;
@override final  String? dbUsername;
@override final  String? dbPassword;
@override final  int? hospitalId;
@override final  int isErp;
@override final  String? medicalType;
@override final  String? patientErpId;
@override final  int? tpaId;
@override final  String fullName;

/// Create a copy of AuthEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthEntityCopyWith<_AuthEntity> get copyWith => __$AuthEntityCopyWithImpl<_AuthEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.thirdName, thirdName) || other.thirdName == thirdName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.email, email) || other.email == email)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.verificationCode, verificationCode) || other.verificationCode == verificationCode)&&const DeepCollectionEquality().equals(other.userVerified, userVerified)&&const DeepCollectionEquality().equals(other.packageExpiry, packageExpiry)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.patientCardNumber, patientCardNumber) || other.patientCardNumber == patientCardNumber)&&(identical(other.nationalNumber, nationalNumber) || other.nationalNumber == nationalNumber)&&(identical(other.secretaryId, secretaryId) || other.secretaryId == secretaryId)&&(identical(other.receptionistId, receptionistId) || other.receptionistId == receptionistId)&&(identical(other.medicalBillerId, medicalBillerId) || other.medicalBillerId == medicalBillerId)&&const DeepCollectionEquality().equals(other.weight, weight)&&const DeepCollectionEquality().equals(other.height, height)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&const DeepCollectionEquality().equals(other.payment, payment)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.refferal, refferal) || other.refferal == refferal)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.physiotherapistId, physiotherapistId) || other.physiotherapistId == physiotherapistId)&&(identical(other.dbName, dbName) || other.dbName == dbName)&&(identical(other.dbUsername, dbUsername) || other.dbUsername == dbUsername)&&(identical(other.dbPassword, dbPassword) || other.dbPassword == dbPassword)&&(identical(other.hospitalId, hospitalId) || other.hospitalId == hospitalId)&&(identical(other.isErp, isErp) || other.isErp == isErp)&&(identical(other.medicalType, medicalType) || other.medicalType == medicalType)&&(identical(other.patientErpId, patientErpId) || other.patientErpId == patientErpId)&&(identical(other.tpaId, tpaId) || other.tpaId == tpaId)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,firstName,secondName,thirdName,lastName,slug,email,locationId,verificationCode,const DeepCollectionEquality().hash(userVerified),const DeepCollectionEquality().hash(packageExpiry),createdAt,updatedAt,dateOfBirth,phoneNumber,patientCardNumber,nationalNumber,secretaryId,receptionistId,medicalBillerId,const DeepCollectionEquality().hash(weight),const DeepCollectionEquality().hash(height),occupation,const DeepCollectionEquality().hash(payment),gender,refferal,profilePic,physiotherapistId,dbName,dbUsername,dbPassword,hospitalId,isErp,medicalType,patientErpId,tpaId,fullName]);

@override
String toString() {
  return 'AuthEntity(id: $id, firstName: $firstName, secondName: $secondName, thirdName: $thirdName, lastName: $lastName, slug: $slug, email: $email, locationId: $locationId, verificationCode: $verificationCode, userVerified: $userVerified, packageExpiry: $packageExpiry, createdAt: $createdAt, updatedAt: $updatedAt, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, patientCardNumber: $patientCardNumber, nationalNumber: $nationalNumber, secretaryId: $secretaryId, receptionistId: $receptionistId, medicalBillerId: $medicalBillerId, weight: $weight, height: $height, occupation: $occupation, payment: $payment, gender: $gender, refferal: $refferal, profilePic: $profilePic, physiotherapistId: $physiotherapistId, dbName: $dbName, dbUsername: $dbUsername, dbPassword: $dbPassword, hospitalId: $hospitalId, isErp: $isErp, medicalType: $medicalType, patientErpId: $patientErpId, tpaId: $tpaId, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$AuthEntityCopyWith<$Res> implements $AuthEntityCopyWith<$Res> {
  factory _$AuthEntityCopyWith(_AuthEntity value, $Res Function(_AuthEntity) _then) = __$AuthEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String? secondName, String? thirdName, String lastName, String slug, String email, int locationId, String? verificationCode, dynamic userVerified, dynamic packageExpiry, String createdAt, String updatedAt, String? dateOfBirth, String? phoneNumber, String? patientCardNumber, String? nationalNumber, int? secretaryId, int? receptionistId, int? medicalBillerId, dynamic weight, dynamic height, String? occupation, dynamic payment, String? gender, String? refferal, String? profilePic, int? physiotherapistId, String? dbName, String? dbUsername, String? dbPassword, int? hospitalId, int isErp, String? medicalType, String? patientErpId, int? tpaId, String fullName
});




}
/// @nodoc
class __$AuthEntityCopyWithImpl<$Res>
    implements _$AuthEntityCopyWith<$Res> {
  __$AuthEntityCopyWithImpl(this._self, this._then);

  final _AuthEntity _self;
  final $Res Function(_AuthEntity) _then;

/// Create a copy of AuthEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? secondName = freezed,Object? thirdName = freezed,Object? lastName = null,Object? slug = null,Object? email = null,Object? locationId = null,Object? verificationCode = freezed,Object? userVerified = freezed,Object? packageExpiry = freezed,Object? createdAt = null,Object? updatedAt = null,Object? dateOfBirth = freezed,Object? phoneNumber = freezed,Object? patientCardNumber = freezed,Object? nationalNumber = freezed,Object? secretaryId = freezed,Object? receptionistId = freezed,Object? medicalBillerId = freezed,Object? weight = freezed,Object? height = freezed,Object? occupation = freezed,Object? payment = freezed,Object? gender = freezed,Object? refferal = freezed,Object? profilePic = freezed,Object? physiotherapistId = freezed,Object? dbName = freezed,Object? dbUsername = freezed,Object? dbPassword = freezed,Object? hospitalId = freezed,Object? isErp = null,Object? medicalType = freezed,Object? patientErpId = freezed,Object? tpaId = freezed,Object? fullName = null,}) {
  return _then(_AuthEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,secondName: freezed == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String?,thirdName: freezed == thirdName ? _self.thirdName : thirdName // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,verificationCode: freezed == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String?,userVerified: freezed == userVerified ? _self.userVerified : userVerified // ignore: cast_nullable_to_non_nullable
as dynamic,packageExpiry: freezed == packageExpiry ? _self.packageExpiry : packageExpiry // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,patientCardNumber: freezed == patientCardNumber ? _self.patientCardNumber : patientCardNumber // ignore: cast_nullable_to_non_nullable
as String?,nationalNumber: freezed == nationalNumber ? _self.nationalNumber : nationalNumber // ignore: cast_nullable_to_non_nullable
as String?,secretaryId: freezed == secretaryId ? _self.secretaryId : secretaryId // ignore: cast_nullable_to_non_nullable
as int?,receptionistId: freezed == receptionistId ? _self.receptionistId : receptionistId // ignore: cast_nullable_to_non_nullable
as int?,medicalBillerId: freezed == medicalBillerId ? _self.medicalBillerId : medicalBillerId // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as dynamic,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as dynamic,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as dynamic,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,refferal: freezed == refferal ? _self.refferal : refferal // ignore: cast_nullable_to_non_nullable
as String?,profilePic: freezed == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String?,physiotherapistId: freezed == physiotherapistId ? _self.physiotherapistId : physiotherapistId // ignore: cast_nullable_to_non_nullable
as int?,dbName: freezed == dbName ? _self.dbName : dbName // ignore: cast_nullable_to_non_nullable
as String?,dbUsername: freezed == dbUsername ? _self.dbUsername : dbUsername // ignore: cast_nullable_to_non_nullable
as String?,dbPassword: freezed == dbPassword ? _self.dbPassword : dbPassword // ignore: cast_nullable_to_non_nullable
as String?,hospitalId: freezed == hospitalId ? _self.hospitalId : hospitalId // ignore: cast_nullable_to_non_nullable
as int?,isErp: null == isErp ? _self.isErp : isErp // ignore: cast_nullable_to_non_nullable
as int,medicalType: freezed == medicalType ? _self.medicalType : medicalType // ignore: cast_nullable_to_non_nullable
as String?,patientErpId: freezed == patientErpId ? _self.patientErpId : patientErpId // ignore: cast_nullable_to_non_nullable
as String?,tpaId: freezed == tpaId ? _self.tpaId : tpaId // ignore: cast_nullable_to_non_nullable
as int?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
