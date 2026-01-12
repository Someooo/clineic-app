// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospital_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HospitalEntity {

 int get id; String get fullName; String? get subHeading; String? get avatar; String? get location; List<String>? get availableDays; String? get workingTime; int? get approvedTeams;
/// Create a copy of HospitalEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HospitalEntityCopyWith<HospitalEntity> get copyWith => _$HospitalEntityCopyWithImpl<HospitalEntity>(this as HospitalEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HospitalEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.subHeading, subHeading) || other.subHeading == subHeading)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.availableDays, availableDays)&&(identical(other.workingTime, workingTime) || other.workingTime == workingTime)&&(identical(other.approvedTeams, approvedTeams) || other.approvedTeams == approvedTeams));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,subHeading,avatar,location,const DeepCollectionEquality().hash(availableDays),workingTime,approvedTeams);

@override
String toString() {
  return 'HospitalEntity(id: $id, fullName: $fullName, subHeading: $subHeading, avatar: $avatar, location: $location, availableDays: $availableDays, workingTime: $workingTime, approvedTeams: $approvedTeams)';
}


}

/// @nodoc
abstract mixin class $HospitalEntityCopyWith<$Res>  {
  factory $HospitalEntityCopyWith(HospitalEntity value, $Res Function(HospitalEntity) _then) = _$HospitalEntityCopyWithImpl;
@useResult
$Res call({
 int id, String fullName, String? subHeading, String? avatar, String? location, List<String>? availableDays, String? workingTime, int? approvedTeams
});




}
/// @nodoc
class _$HospitalEntityCopyWithImpl<$Res>
    implements $HospitalEntityCopyWith<$Res> {
  _$HospitalEntityCopyWithImpl(this._self, this._then);

  final HospitalEntity _self;
  final $Res Function(HospitalEntity) _then;

/// Create a copy of HospitalEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? subHeading = freezed,Object? avatar = freezed,Object? location = freezed,Object? availableDays = freezed,Object? workingTime = freezed,Object? approvedTeams = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,subHeading: freezed == subHeading ? _self.subHeading : subHeading // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,availableDays: freezed == availableDays ? _self.availableDays : availableDays // ignore: cast_nullable_to_non_nullable
as List<String>?,workingTime: freezed == workingTime ? _self.workingTime : workingTime // ignore: cast_nullable_to_non_nullable
as String?,approvedTeams: freezed == approvedTeams ? _self.approvedTeams : approvedTeams // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [HospitalEntity].
extension HospitalEntityPatterns on HospitalEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HospitalEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HospitalEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HospitalEntity value)  $default,){
final _that = this;
switch (_that) {
case _HospitalEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HospitalEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HospitalEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String fullName,  String? subHeading,  String? avatar,  String? location,  List<String>? availableDays,  String? workingTime,  int? approvedTeams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HospitalEntity() when $default != null:
return $default(_that.id,_that.fullName,_that.subHeading,_that.avatar,_that.location,_that.availableDays,_that.workingTime,_that.approvedTeams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String fullName,  String? subHeading,  String? avatar,  String? location,  List<String>? availableDays,  String? workingTime,  int? approvedTeams)  $default,) {final _that = this;
switch (_that) {
case _HospitalEntity():
return $default(_that.id,_that.fullName,_that.subHeading,_that.avatar,_that.location,_that.availableDays,_that.workingTime,_that.approvedTeams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String fullName,  String? subHeading,  String? avatar,  String? location,  List<String>? availableDays,  String? workingTime,  int? approvedTeams)?  $default,) {final _that = this;
switch (_that) {
case _HospitalEntity() when $default != null:
return $default(_that.id,_that.fullName,_that.subHeading,_that.avatar,_that.location,_that.availableDays,_that.workingTime,_that.approvedTeams);case _:
  return null;

}
}

}

/// @nodoc


class _HospitalEntity implements HospitalEntity {
  const _HospitalEntity({required this.id, required this.fullName, this.subHeading, this.avatar, this.location, final  List<String>? availableDays, this.workingTime, this.approvedTeams}): _availableDays = availableDays;
  

@override final  int id;
@override final  String fullName;
@override final  String? subHeading;
@override final  String? avatar;
@override final  String? location;
 final  List<String>? _availableDays;
@override List<String>? get availableDays {
  final value = _availableDays;
  if (value == null) return null;
  if (_availableDays is EqualUnmodifiableListView) return _availableDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? workingTime;
@override final  int? approvedTeams;

/// Create a copy of HospitalEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HospitalEntityCopyWith<_HospitalEntity> get copyWith => __$HospitalEntityCopyWithImpl<_HospitalEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HospitalEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.subHeading, subHeading) || other.subHeading == subHeading)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._availableDays, _availableDays)&&(identical(other.workingTime, workingTime) || other.workingTime == workingTime)&&(identical(other.approvedTeams, approvedTeams) || other.approvedTeams == approvedTeams));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,subHeading,avatar,location,const DeepCollectionEquality().hash(_availableDays),workingTime,approvedTeams);

@override
String toString() {
  return 'HospitalEntity(id: $id, fullName: $fullName, subHeading: $subHeading, avatar: $avatar, location: $location, availableDays: $availableDays, workingTime: $workingTime, approvedTeams: $approvedTeams)';
}


}

/// @nodoc
abstract mixin class _$HospitalEntityCopyWith<$Res> implements $HospitalEntityCopyWith<$Res> {
  factory _$HospitalEntityCopyWith(_HospitalEntity value, $Res Function(_HospitalEntity) _then) = __$HospitalEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String fullName, String? subHeading, String? avatar, String? location, List<String>? availableDays, String? workingTime, int? approvedTeams
});




}
/// @nodoc
class __$HospitalEntityCopyWithImpl<$Res>
    implements _$HospitalEntityCopyWith<$Res> {
  __$HospitalEntityCopyWithImpl(this._self, this._then);

  final _HospitalEntity _self;
  final $Res Function(_HospitalEntity) _then;

/// Create a copy of HospitalEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? subHeading = freezed,Object? avatar = freezed,Object? location = freezed,Object? availableDays = freezed,Object? workingTime = freezed,Object? approvedTeams = freezed,}) {
  return _then(_HospitalEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,subHeading: freezed == subHeading ? _self.subHeading : subHeading // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,availableDays: freezed == availableDays ? _self._availableDays : availableDays // ignore: cast_nullable_to_non_nullable
as List<String>?,workingTime: freezed == workingTime ? _self.workingTime : workingTime // ignore: cast_nullable_to_non_nullable
as String?,approvedTeams: freezed == approvedTeams ? _self.approvedTeams : approvedTeams // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
