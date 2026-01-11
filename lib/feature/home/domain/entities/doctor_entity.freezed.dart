// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DoctorEntity {

 int get id; String get fullName; String? get subHeading; String? get avatar; String? get averageRating; int? get totalRating; dynamic get location; List<dynamic>? get specialities; List<dynamic>? get services; String? get availableDays; dynamic get startingPrice; int? get votes; dynamic get workingTime;
/// Create a copy of DoctorEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorEntityCopyWith<DoctorEntity> get copyWith => _$DoctorEntityCopyWithImpl<DoctorEntity>(this as DoctorEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.subHeading, subHeading) || other.subHeading == subHeading)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalRating, totalRating) || other.totalRating == totalRating)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.specialities, specialities)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.availableDays, availableDays) || other.availableDays == availableDays)&&const DeepCollectionEquality().equals(other.startingPrice, startingPrice)&&(identical(other.votes, votes) || other.votes == votes)&&const DeepCollectionEquality().equals(other.workingTime, workingTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,subHeading,avatar,averageRating,totalRating,const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(specialities),const DeepCollectionEquality().hash(services),availableDays,const DeepCollectionEquality().hash(startingPrice),votes,const DeepCollectionEquality().hash(workingTime));

@override
String toString() {
  return 'DoctorEntity(id: $id, fullName: $fullName, subHeading: $subHeading, avatar: $avatar, averageRating: $averageRating, totalRating: $totalRating, location: $location, specialities: $specialities, services: $services, availableDays: $availableDays, startingPrice: $startingPrice, votes: $votes, workingTime: $workingTime)';
}


}

/// @nodoc
abstract mixin class $DoctorEntityCopyWith<$Res>  {
  factory $DoctorEntityCopyWith(DoctorEntity value, $Res Function(DoctorEntity) _then) = _$DoctorEntityCopyWithImpl;
@useResult
$Res call({
 int id, String fullName, String? subHeading, String? avatar, String? averageRating, int? totalRating, dynamic location, List<dynamic>? specialities, List<dynamic>? services, String? availableDays, dynamic startingPrice, int? votes, dynamic workingTime
});




}
/// @nodoc
class _$DoctorEntityCopyWithImpl<$Res>
    implements $DoctorEntityCopyWith<$Res> {
  _$DoctorEntityCopyWithImpl(this._self, this._then);

  final DoctorEntity _self;
  final $Res Function(DoctorEntity) _then;

/// Create a copy of DoctorEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? subHeading = freezed,Object? avatar = freezed,Object? averageRating = freezed,Object? totalRating = freezed,Object? location = freezed,Object? specialities = freezed,Object? services = freezed,Object? availableDays = freezed,Object? startingPrice = freezed,Object? votes = freezed,Object? workingTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,subHeading: freezed == subHeading ? _self.subHeading : subHeading // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as String?,totalRating: freezed == totalRating ? _self.totalRating : totalRating // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as dynamic,specialities: freezed == specialities ? _self.specialities : specialities // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,services: freezed == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,availableDays: freezed == availableDays ? _self.availableDays : availableDays // ignore: cast_nullable_to_non_nullable
as String?,startingPrice: freezed == startingPrice ? _self.startingPrice : startingPrice // ignore: cast_nullable_to_non_nullable
as dynamic,votes: freezed == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int?,workingTime: freezed == workingTime ? _self.workingTime : workingTime // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorEntity].
extension DoctorEntityPatterns on DoctorEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorEntity value)  $default,){
final _that = this;
switch (_that) {
case _DoctorEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String fullName,  String? subHeading,  String? avatar,  String? averageRating,  int? totalRating,  dynamic location,  List<dynamic>? specialities,  List<dynamic>? services,  String? availableDays,  dynamic startingPrice,  int? votes,  dynamic workingTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorEntity() when $default != null:
return $default(_that.id,_that.fullName,_that.subHeading,_that.avatar,_that.averageRating,_that.totalRating,_that.location,_that.specialities,_that.services,_that.availableDays,_that.startingPrice,_that.votes,_that.workingTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String fullName,  String? subHeading,  String? avatar,  String? averageRating,  int? totalRating,  dynamic location,  List<dynamic>? specialities,  List<dynamic>? services,  String? availableDays,  dynamic startingPrice,  int? votes,  dynamic workingTime)  $default,) {final _that = this;
switch (_that) {
case _DoctorEntity():
return $default(_that.id,_that.fullName,_that.subHeading,_that.avatar,_that.averageRating,_that.totalRating,_that.location,_that.specialities,_that.services,_that.availableDays,_that.startingPrice,_that.votes,_that.workingTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String fullName,  String? subHeading,  String? avatar,  String? averageRating,  int? totalRating,  dynamic location,  List<dynamic>? specialities,  List<dynamic>? services,  String? availableDays,  dynamic startingPrice,  int? votes,  dynamic workingTime)?  $default,) {final _that = this;
switch (_that) {
case _DoctorEntity() when $default != null:
return $default(_that.id,_that.fullName,_that.subHeading,_that.avatar,_that.averageRating,_that.totalRating,_that.location,_that.specialities,_that.services,_that.availableDays,_that.startingPrice,_that.votes,_that.workingTime);case _:
  return null;

}
}

}

/// @nodoc


class _DoctorEntity implements DoctorEntity {
  const _DoctorEntity({required this.id, required this.fullName, this.subHeading, this.avatar, this.averageRating, this.totalRating, this.location, final  List<dynamic>? specialities, final  List<dynamic>? services, this.availableDays, this.startingPrice, this.votes, this.workingTime}): _specialities = specialities,_services = services;
  

@override final  int id;
@override final  String fullName;
@override final  String? subHeading;
@override final  String? avatar;
@override final  String? averageRating;
@override final  int? totalRating;
@override final  dynamic location;
 final  List<dynamic>? _specialities;
@override List<dynamic>? get specialities {
  final value = _specialities;
  if (value == null) return null;
  if (_specialities is EqualUnmodifiableListView) return _specialities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _services;
@override List<dynamic>? get services {
  final value = _services;
  if (value == null) return null;
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? availableDays;
@override final  dynamic startingPrice;
@override final  int? votes;
@override final  dynamic workingTime;

/// Create a copy of DoctorEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorEntityCopyWith<_DoctorEntity> get copyWith => __$DoctorEntityCopyWithImpl<_DoctorEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.subHeading, subHeading) || other.subHeading == subHeading)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalRating, totalRating) || other.totalRating == totalRating)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other._specialities, _specialities)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.availableDays, availableDays) || other.availableDays == availableDays)&&const DeepCollectionEquality().equals(other.startingPrice, startingPrice)&&(identical(other.votes, votes) || other.votes == votes)&&const DeepCollectionEquality().equals(other.workingTime, workingTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,subHeading,avatar,averageRating,totalRating,const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(_specialities),const DeepCollectionEquality().hash(_services),availableDays,const DeepCollectionEquality().hash(startingPrice),votes,const DeepCollectionEquality().hash(workingTime));

@override
String toString() {
  return 'DoctorEntity(id: $id, fullName: $fullName, subHeading: $subHeading, avatar: $avatar, averageRating: $averageRating, totalRating: $totalRating, location: $location, specialities: $specialities, services: $services, availableDays: $availableDays, startingPrice: $startingPrice, votes: $votes, workingTime: $workingTime)';
}


}

/// @nodoc
abstract mixin class _$DoctorEntityCopyWith<$Res> implements $DoctorEntityCopyWith<$Res> {
  factory _$DoctorEntityCopyWith(_DoctorEntity value, $Res Function(_DoctorEntity) _then) = __$DoctorEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String fullName, String? subHeading, String? avatar, String? averageRating, int? totalRating, dynamic location, List<dynamic>? specialities, List<dynamic>? services, String? availableDays, dynamic startingPrice, int? votes, dynamic workingTime
});




}
/// @nodoc
class __$DoctorEntityCopyWithImpl<$Res>
    implements _$DoctorEntityCopyWith<$Res> {
  __$DoctorEntityCopyWithImpl(this._self, this._then);

  final _DoctorEntity _self;
  final $Res Function(_DoctorEntity) _then;

/// Create a copy of DoctorEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? subHeading = freezed,Object? avatar = freezed,Object? averageRating = freezed,Object? totalRating = freezed,Object? location = freezed,Object? specialities = freezed,Object? services = freezed,Object? availableDays = freezed,Object? startingPrice = freezed,Object? votes = freezed,Object? workingTime = freezed,}) {
  return _then(_DoctorEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,subHeading: freezed == subHeading ? _self.subHeading : subHeading // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as String?,totalRating: freezed == totalRating ? _self.totalRating : totalRating // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as dynamic,specialities: freezed == specialities ? _self._specialities : specialities // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,services: freezed == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,availableDays: freezed == availableDays ? _self.availableDays : availableDays // ignore: cast_nullable_to_non_nullable
as String?,startingPrice: freezed == startingPrice ? _self.startingPrice : startingPrice // ignore: cast_nullable_to_non_nullable
as dynamic,votes: freezed == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int?,workingTime: freezed == workingTime ? _self.workingTime : workingTime // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
