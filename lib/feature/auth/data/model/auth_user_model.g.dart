// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthUserModelAdapter extends TypeAdapter<_AuthUserModel> {
  @override
  final typeId = 100;

  @override
  _AuthUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _AuthUserModel(
      id: (fields[1] as num).toInt(),
      firstName: fields[2] as String,
      secondName: fields[3] as String?,
      thirdName: fields[4] as String?,
      lastName: fields[5] as String,
      slug: fields[6] as String,
      email: fields[7] as String,
      locationId: (fields[8] as num).toInt(),
      verificationCode: fields[9] as String?,
      userVerified: fields[10] as Object?,
      packageExpiry: fields[11] as Object?,
      createdAt: fields[12] as String,
      updatedAt: fields[13] as String,
      dateOfBirth: fields[14] as String?,
      phoneNumber: fields[15] as String?,
      patientCardNumber: fields[16] as String?,
      nationalNumber: fields[17] as String?,
      secretaryId: (fields[18] as num?)?.toInt(),
      receptionistId: (fields[19] as num?)?.toInt(),
      medicalBillerId: (fields[20] as num?)?.toInt(),
      weight: fields[21] as Object?,
      height: fields[22] as Object?,
      occupation: fields[23] as String?,
      payment: fields[24] as Object?,
      gender: fields[25] as String?,
      refferal: fields[26] as String?,
      profilePic: fields[27] as String?,
      physiotherapistId: (fields[28] as num?)?.toInt(),
      dbName: fields[29] as String?,
      dbUsername: fields[30] as String?,
      dbPassword: fields[31] as String?,
      hospitalId: (fields[32] as num?)?.toInt(),
      isErp: (fields[33] as num).toInt(),
      medicalType: fields[34] as String?,
      patientErpId: fields[35] as String?,
      tpaId: (fields[36] as num?)?.toInt(),
      fullName: fields[37] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _AuthUserModel obj) {
    writer
      ..writeByte(37)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.secondName)
      ..writeByte(4)
      ..write(obj.thirdName)
      ..writeByte(5)
      ..write(obj.lastName)
      ..writeByte(6)
      ..write(obj.slug)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.locationId)
      ..writeByte(9)
      ..write(obj.verificationCode)
      ..writeByte(10)
      ..write(obj.userVerified)
      ..writeByte(11)
      ..write(obj.packageExpiry)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt)
      ..writeByte(14)
      ..write(obj.dateOfBirth)
      ..writeByte(15)
      ..write(obj.phoneNumber)
      ..writeByte(16)
      ..write(obj.patientCardNumber)
      ..writeByte(17)
      ..write(obj.nationalNumber)
      ..writeByte(18)
      ..write(obj.secretaryId)
      ..writeByte(19)
      ..write(obj.receptionistId)
      ..writeByte(20)
      ..write(obj.medicalBillerId)
      ..writeByte(21)
      ..write(obj.weight)
      ..writeByte(22)
      ..write(obj.height)
      ..writeByte(23)
      ..write(obj.occupation)
      ..writeByte(24)
      ..write(obj.payment)
      ..writeByte(25)
      ..write(obj.gender)
      ..writeByte(26)
      ..write(obj.refferal)
      ..writeByte(27)
      ..write(obj.profilePic)
      ..writeByte(28)
      ..write(obj.physiotherapistId)
      ..writeByte(29)
      ..write(obj.dbName)
      ..writeByte(30)
      ..write(obj.dbUsername)
      ..writeByte(31)
      ..write(obj.dbPassword)
      ..writeByte(32)
      ..write(obj.hospitalId)
      ..writeByte(33)
      ..write(obj.isErp)
      ..writeByte(34)
      ..write(obj.medicalType)
      ..writeByte(35)
      ..write(obj.patientErpId)
      ..writeByte(36)
      ..write(obj.tpaId)
      ..writeByte(37)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserModel _$AuthUserModelFromJson(Map<String, dynamic> json) =>
    _AuthUserModel(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      secondName: json['second_name'] as String?,
      thirdName: json['third_name'] as String?,
      lastName: json['last_name'] as String,
      slug: json['slug'] as String,
      email: json['email'] as String,
      locationId: (json['location_id'] as num).toInt(),
      verificationCode: json['verification_code'] as String?,
      userVerified: json['user_verified'],
      packageExpiry: json['package_expiry'],
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      dateOfBirth: json['date_of_birth'] as String?,
      phoneNumber: json['phone_number'] as String?,
      patientCardNumber: json['patient_card_number'] as String?,
      nationalNumber: json['national_number'] as String?,
      secretaryId: (json['secretary_id'] as num?)?.toInt(),
      receptionistId: (json['receptionist_id'] as num?)?.toInt(),
      medicalBillerId: (json['medical_biller_id'] as num?)?.toInt(),
      weight: json['weight'],
      height: json['height'],
      occupation: json['occupation'] as String?,
      payment: json['payment'],
      gender: json['gender'] as String?,
      refferal: json['refferal'] as String?,
      profilePic: json['profile_pic'] as String?,
      physiotherapistId: (json['physiotherapist_id'] as num?)?.toInt(),
      dbName: json['db_name'] as String?,
      dbUsername: json['db_username'] as String?,
      dbPassword: json['db_password'] as String?,
      hospitalId: (json['hospital_id'] as num?)?.toInt(),
      isErp: (json['is_erp'] as num).toInt(),
      medicalType: json['medical_type'] as String?,
      patientErpId: json['patient_erp_id'] as String?,
      tpaId: (json['tpa_id'] as num?)?.toInt(),
      fullName: json['full_name'] as String,
    );

Map<String, dynamic> _$AuthUserModelToJson(_AuthUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'second_name': instance.secondName,
      'third_name': instance.thirdName,
      'last_name': instance.lastName,
      'slug': instance.slug,
      'email': instance.email,
      'location_id': instance.locationId,
      'verification_code': instance.verificationCode,
      'user_verified': instance.userVerified,
      'package_expiry': instance.packageExpiry,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'date_of_birth': instance.dateOfBirth,
      'phone_number': instance.phoneNumber,
      'patient_card_number': instance.patientCardNumber,
      'national_number': instance.nationalNumber,
      'secretary_id': instance.secretaryId,
      'receptionist_id': instance.receptionistId,
      'medical_biller_id': instance.medicalBillerId,
      'weight': instance.weight,
      'height': instance.height,
      'occupation': instance.occupation,
      'payment': instance.payment,
      'gender': instance.gender,
      'refferal': instance.refferal,
      'profile_pic': instance.profilePic,
      'physiotherapist_id': instance.physiotherapistId,
      'db_name': instance.dbName,
      'db_username': instance.dbUsername,
      'db_password': instance.dbPassword,
      'hospital_id': instance.hospitalId,
      'is_erp': instance.isErp,
      'medical_type': instance.medicalType,
      'patient_erp_id': instance.patientErpId,
      'tpa_id': instance.tpaId,
      'full_name': instance.fullName,
    };
