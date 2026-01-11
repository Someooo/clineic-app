// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoctorModel {

@JsonKey(name: "id") int get id;@JsonKey(name: "full_name") String get fullName;@JsonKey(name: "sub_heading") String? get subHeading;@JsonKey(name: "avatar") String? get avatar;@JsonKey(name: "average_rating") String? get averageRating;@JsonKey(name: "total_rating") int? get totalRating;@JsonKey(name: "location") dynamic get location;@JsonKey(name: "specialities") List<dynamic>? get specialities;@JsonKey(name: "services") List<dynamic>? get services;@JsonKey(name: "available_days") String? get availableDays;@JsonKey(name: "starting_price") dynamic get startingPrice;@JsonKey(name: "votes") int? get votes;@JsonKey(name: "working_time") dynamic get workingTime;
/// Create a copy of DoctorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorModelCopyWith<DoctorModel> get copyWith => _$DoctorModelCopyWithImpl<DoctorModel>(this as DoctorModel, _$identity);

  /// Serializes this DoctorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.subHeading, subHeading) || other.subHeading == subHeading)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalRating, totalRating) || other.totalRating == totalRating)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.specialities, specialities)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.availableDays, availableDays) || other.availableDays == availableDays)&&const DeepCollectionEquality().equals(other.startingPrice, startingPrice)&&(identical(other.votes, votes) || other.votes == votes)&&const DeepCollectionEquality().equals(other.workingTime, workingTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,subHeading,avatar,averageRating,totalRating,const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(specialities),const DeepCollectionEquality().hash(services),availableDays,const DeepCollectionEquality().hash(startingPrice),votes,const DeepCollectionEquality().hash(workingTime));

@override
String toString() {
  return 'DoctorModel(id: $id, fullName: $fullName, subHeading: $subHeading, avatar: $avatar, averageRating: $averageRating, totalRating: $totalRating, location: $location, specialities: $specialities, services: $services, availableDays: $availableDays, startingPrice: $startingPrice, votes: $votes, workingTime: $workingTime)';
}


}

/// @nodoc
abstract mixin class $DoctorModelCopyWith<$Res>  {
  factory $DoctorModelCopyWith(DoctorModel value, $Res Function(DoctorModel) _then) = _$DoctorModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "sub_heading") String? subHeading,@JsonKey(name: "avatar") String? avatar,@JsonKey(name: "average_rating") String? averageRating,@JsonKey(name: "total_rating") int? totalRating,@JsonKey(name: "location") dynamic location,@JsonKey(name: "specialities") List<dynamic>? specialities,@JsonKey(name: "services") List<dynamic>? services,@JsonKey(name: "available_days") String? availableDays,@JsonKey(name: "starting_price") dynamic startingPrice,@JsonKey(name: "votes") int? votes,@JsonKey(name: "working_time") dynamic workingTime
});




}
/// @nodoc
class _$DoctorModelCopyWithImpl<$Res>
    implements $DoctorModelCopyWith<$Res> {
  _$DoctorModelCopyWithImpl(this._self, this._then);

  final DoctorModel _self;
  final $Res Function(DoctorModel) _then;

/// Create a copy of DoctorModel
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


/// Adds pattern-matching-related methods to [DoctorModel].
extension DoctorModelPatterns on DoctorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorModel value)  $default,){
final _that = this;
switch (_that) {
case _DoctorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorModel value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "sub_heading")  String? subHeading, @JsonKey(name: "avatar")  String? avatar, @JsonKey(name: "average_rating")  String? averageRating, @JsonKey(name: "total_rating")  int? totalRating, @JsonKey(name: "location")  dynamic location, @JsonKey(name: "specialities")  List<dynamic>? specialities, @JsonKey(name: "services")  List<dynamic>? services, @JsonKey(name: "available_days")  String? availableDays, @JsonKey(name: "starting_price")  dynamic startingPrice, @JsonKey(name: "votes")  int? votes, @JsonKey(name: "working_time")  dynamic workingTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "sub_heading")  String? subHeading, @JsonKey(name: "avatar")  String? avatar, @JsonKey(name: "average_rating")  String? averageRating, @JsonKey(name: "total_rating")  int? totalRating, @JsonKey(name: "location")  dynamic location, @JsonKey(name: "specialities")  List<dynamic>? specialities, @JsonKey(name: "services")  List<dynamic>? services, @JsonKey(name: "available_days")  String? availableDays, @JsonKey(name: "starting_price")  dynamic startingPrice, @JsonKey(name: "votes")  int? votes, @JsonKey(name: "working_time")  dynamic workingTime)  $default,) {final _that = this;
switch (_that) {
case _DoctorModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "sub_heading")  String? subHeading, @JsonKey(name: "avatar")  String? avatar, @JsonKey(name: "average_rating")  String? averageRating, @JsonKey(name: "total_rating")  int? totalRating, @JsonKey(name: "location")  dynamic location, @JsonKey(name: "specialities")  List<dynamic>? specialities, @JsonKey(name: "services")  List<dynamic>? services, @JsonKey(name: "available_days")  String? availableDays, @JsonKey(name: "starting_price")  dynamic startingPrice, @JsonKey(name: "votes")  int? votes, @JsonKey(name: "working_time")  dynamic workingTime)?  $default,) {final _that = this;
switch (_that) {
case _DoctorModel() when $default != null:
return $default(_that.id,_that.fullName,_that.subHeading,_that.avatar,_that.averageRating,_that.totalRating,_that.location,_that.specialities,_that.services,_that.availableDays,_that.startingPrice,_that.votes,_that.workingTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorModel implements DoctorModel {
  const _DoctorModel({@JsonKey(name: "id") required this.id, @JsonKey(name: "full_name") required this.fullName, @JsonKey(name: "sub_heading") this.subHeading, @JsonKey(name: "avatar") this.avatar, @JsonKey(name: "average_rating") this.averageRating, @JsonKey(name: "total_rating") this.totalRating, @JsonKey(name: "location") this.location, @JsonKey(name: "specialities") final  List<dynamic>? specialities, @JsonKey(name: "services") final  List<dynamic>? services, @JsonKey(name: "available_days") this.availableDays, @JsonKey(name: "starting_price") this.startingPrice, @JsonKey(name: "votes") this.votes, @JsonKey(name: "working_time") this.workingTime}): _specialities = specialities,_services = services;
  factory _DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "full_name") final  String fullName;
@override@JsonKey(name: "sub_heading") final  String? subHeading;
@override@JsonKey(name: "avatar") final  String? avatar;
@override@JsonKey(name: "average_rating") final  String? averageRating;
@override@JsonKey(name: "total_rating") final  int? totalRating;
@override@JsonKey(name: "location") final  dynamic location;
 final  List<dynamic>? _specialities;
@override@JsonKey(name: "specialities") List<dynamic>? get specialities {
  final value = _specialities;
  if (value == null) return null;
  if (_specialities is EqualUnmodifiableListView) return _specialities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _services;
@override@JsonKey(name: "services") List<dynamic>? get services {
  final value = _services;
  if (value == null) return null;
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "available_days") final  String? availableDays;
@override@JsonKey(name: "starting_price") final  dynamic startingPrice;
@override@JsonKey(name: "votes") final  int? votes;
@override@JsonKey(name: "working_time") final  dynamic workingTime;

/// Create a copy of DoctorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorModelCopyWith<_DoctorModel> get copyWith => __$DoctorModelCopyWithImpl<_DoctorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.subHeading, subHeading) || other.subHeading == subHeading)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalRating, totalRating) || other.totalRating == totalRating)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other._specialities, _specialities)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.availableDays, availableDays) || other.availableDays == availableDays)&&const DeepCollectionEquality().equals(other.startingPrice, startingPrice)&&(identical(other.votes, votes) || other.votes == votes)&&const DeepCollectionEquality().equals(other.workingTime, workingTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,subHeading,avatar,averageRating,totalRating,const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(_specialities),const DeepCollectionEquality().hash(_services),availableDays,const DeepCollectionEquality().hash(startingPrice),votes,const DeepCollectionEquality().hash(workingTime));

@override
String toString() {
  return 'DoctorModel(id: $id, fullName: $fullName, subHeading: $subHeading, avatar: $avatar, averageRating: $averageRating, totalRating: $totalRating, location: $location, specialities: $specialities, services: $services, availableDays: $availableDays, startingPrice: $startingPrice, votes: $votes, workingTime: $workingTime)';
}


}

/// @nodoc
abstract mixin class _$DoctorModelCopyWith<$Res> implements $DoctorModelCopyWith<$Res> {
  factory _$DoctorModelCopyWith(_DoctorModel value, $Res Function(_DoctorModel) _then) = __$DoctorModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "sub_heading") String? subHeading,@JsonKey(name: "avatar") String? avatar,@JsonKey(name: "average_rating") String? averageRating,@JsonKey(name: "total_rating") int? totalRating,@JsonKey(name: "location") dynamic location,@JsonKey(name: "specialities") List<dynamic>? specialities,@JsonKey(name: "services") List<dynamic>? services,@JsonKey(name: "available_days") String? availableDays,@JsonKey(name: "starting_price") dynamic startingPrice,@JsonKey(name: "votes") int? votes,@JsonKey(name: "working_time") dynamic workingTime
});




}
/// @nodoc
class __$DoctorModelCopyWithImpl<$Res>
    implements _$DoctorModelCopyWith<$Res> {
  __$DoctorModelCopyWithImpl(this._self, this._then);

  final _DoctorModel _self;
  final $Res Function(_DoctorModel) _then;

/// Create a copy of DoctorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? subHeading = freezed,Object? avatar = freezed,Object? averageRating = freezed,Object? totalRating = freezed,Object? location = freezed,Object? specialities = freezed,Object? services = freezed,Object? availableDays = freezed,Object? startingPrice = freezed,Object? votes = freezed,Object? workingTime = freezed,}) {
  return _then(_DoctorModel(
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
