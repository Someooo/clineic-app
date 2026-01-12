// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospital_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HospitalModel {

@JsonKey(name: "id") int get id;@JsonKey(name: "full_name") String get fullName;@JsonKey(name: "sub_heading") String? get subHeading;@JsonKey(name: "avatar") String? get avatar;@JsonKey(name: "location") String? get location;@JsonKey(name: "available_days") List<String>? get availableDays;@JsonKey(name: "working_time") String? get workingTime;@JsonKey(name: "approvedTeams") int? get approvedTeams;
/// Create a copy of HospitalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HospitalModelCopyWith<HospitalModel> get copyWith => _$HospitalModelCopyWithImpl<HospitalModel>(this as HospitalModel, _$identity);

  /// Serializes this HospitalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HospitalModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.subHeading, subHeading) || other.subHeading == subHeading)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.availableDays, availableDays)&&(identical(other.workingTime, workingTime) || other.workingTime == workingTime)&&(identical(other.approvedTeams, approvedTeams) || other.approvedTeams == approvedTeams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,subHeading,avatar,location,const DeepCollectionEquality().hash(availableDays),workingTime,approvedTeams);

@override
String toString() {
  return 'HospitalModel(id: $id, fullName: $fullName, subHeading: $subHeading, avatar: $avatar, location: $location, availableDays: $availableDays, workingTime: $workingTime, approvedTeams: $approvedTeams)';
}


}

/// @nodoc
abstract mixin class $HospitalModelCopyWith<$Res>  {
  factory $HospitalModelCopyWith(HospitalModel value, $Res Function(HospitalModel) _then) = _$HospitalModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "sub_heading") String? subHeading,@JsonKey(name: "avatar") String? avatar,@JsonKey(name: "location") String? location,@JsonKey(name: "available_days") List<String>? availableDays,@JsonKey(name: "working_time") String? workingTime,@JsonKey(name: "approvedTeams") int? approvedTeams
});




}
/// @nodoc
class _$HospitalModelCopyWithImpl<$Res>
    implements $HospitalModelCopyWith<$Res> {
  _$HospitalModelCopyWithImpl(this._self, this._then);

  final HospitalModel _self;
  final $Res Function(HospitalModel) _then;

/// Create a copy of HospitalModel
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


/// Adds pattern-matching-related methods to [HospitalModel].
extension HospitalModelPatterns on HospitalModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HospitalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HospitalModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HospitalModel value)  $default,){
final _that = this;
switch (_that) {
case _HospitalModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HospitalModel value)?  $default,){
final _that = this;
switch (_that) {
case _HospitalModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "sub_heading")  String? subHeading, @JsonKey(name: "avatar")  String? avatar, @JsonKey(name: "location")  String? location, @JsonKey(name: "available_days")  List<String>? availableDays, @JsonKey(name: "working_time")  String? workingTime, @JsonKey(name: "approvedTeams")  int? approvedTeams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HospitalModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "sub_heading")  String? subHeading, @JsonKey(name: "avatar")  String? avatar, @JsonKey(name: "location")  String? location, @JsonKey(name: "available_days")  List<String>? availableDays, @JsonKey(name: "working_time")  String? workingTime, @JsonKey(name: "approvedTeams")  int? approvedTeams)  $default,) {final _that = this;
switch (_that) {
case _HospitalModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "sub_heading")  String? subHeading, @JsonKey(name: "avatar")  String? avatar, @JsonKey(name: "location")  String? location, @JsonKey(name: "available_days")  List<String>? availableDays, @JsonKey(name: "working_time")  String? workingTime, @JsonKey(name: "approvedTeams")  int? approvedTeams)?  $default,) {final _that = this;
switch (_that) {
case _HospitalModel() when $default != null:
return $default(_that.id,_that.fullName,_that.subHeading,_that.avatar,_that.location,_that.availableDays,_that.workingTime,_that.approvedTeams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HospitalModel implements HospitalModel {
  const _HospitalModel({@JsonKey(name: "id") required this.id, @JsonKey(name: "full_name") required this.fullName, @JsonKey(name: "sub_heading") this.subHeading, @JsonKey(name: "avatar") this.avatar, @JsonKey(name: "location") this.location, @JsonKey(name: "available_days") final  List<String>? availableDays, @JsonKey(name: "working_time") this.workingTime, @JsonKey(name: "approvedTeams") this.approvedTeams}): _availableDays = availableDays;
  factory _HospitalModel.fromJson(Map<String, dynamic> json) => _$HospitalModelFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "full_name") final  String fullName;
@override@JsonKey(name: "sub_heading") final  String? subHeading;
@override@JsonKey(name: "avatar") final  String? avatar;
@override@JsonKey(name: "location") final  String? location;
 final  List<String>? _availableDays;
@override@JsonKey(name: "available_days") List<String>? get availableDays {
  final value = _availableDays;
  if (value == null) return null;
  if (_availableDays is EqualUnmodifiableListView) return _availableDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "working_time") final  String? workingTime;
@override@JsonKey(name: "approvedTeams") final  int? approvedTeams;

/// Create a copy of HospitalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HospitalModelCopyWith<_HospitalModel> get copyWith => __$HospitalModelCopyWithImpl<_HospitalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HospitalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HospitalModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.subHeading, subHeading) || other.subHeading == subHeading)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._availableDays, _availableDays)&&(identical(other.workingTime, workingTime) || other.workingTime == workingTime)&&(identical(other.approvedTeams, approvedTeams) || other.approvedTeams == approvedTeams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,subHeading,avatar,location,const DeepCollectionEquality().hash(_availableDays),workingTime,approvedTeams);

@override
String toString() {
  return 'HospitalModel(id: $id, fullName: $fullName, subHeading: $subHeading, avatar: $avatar, location: $location, availableDays: $availableDays, workingTime: $workingTime, approvedTeams: $approvedTeams)';
}


}

/// @nodoc
abstract mixin class _$HospitalModelCopyWith<$Res> implements $HospitalModelCopyWith<$Res> {
  factory _$HospitalModelCopyWith(_HospitalModel value, $Res Function(_HospitalModel) _then) = __$HospitalModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "sub_heading") String? subHeading,@JsonKey(name: "avatar") String? avatar,@JsonKey(name: "location") String? location,@JsonKey(name: "available_days") List<String>? availableDays,@JsonKey(name: "working_time") String? workingTime,@JsonKey(name: "approvedTeams") int? approvedTeams
});




}
/// @nodoc
class __$HospitalModelCopyWithImpl<$Res>
    implements _$HospitalModelCopyWith<$Res> {
  __$HospitalModelCopyWithImpl(this._self, this._then);

  final _HospitalModel _self;
  final $Res Function(_HospitalModel) _then;

/// Create a copy of HospitalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? subHeading = freezed,Object? avatar = freezed,Object? location = freezed,Object? availableDays = freezed,Object? workingTime = freezed,Object? approvedTeams = freezed,}) {
  return _then(_HospitalModel(
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
