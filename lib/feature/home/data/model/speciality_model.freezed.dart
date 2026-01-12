// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speciality_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpecialityModel {

@JsonKey(name: "id") int get id;@JsonKey(name: "name") String get name;@JsonKey(name: "slug") String get slug;@JsonKey(name: "url") String? get url;@JsonKey(name: "color") String? get color;
/// Create a copy of SpecialityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecialityModelCopyWith<SpecialityModel> get copyWith => _$SpecialityModelCopyWithImpl<SpecialityModel>(this as SpecialityModel, _$identity);

  /// Serializes this SpecialityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.url, url) || other.url == url)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,url,color);

@override
String toString() {
  return 'SpecialityModel(id: $id, name: $name, slug: $slug, url: $url, color: $color)';
}


}

/// @nodoc
abstract mixin class $SpecialityModelCopyWith<$Res>  {
  factory $SpecialityModelCopyWith(SpecialityModel value, $Res Function(SpecialityModel) _then) = _$SpecialityModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "name") String name,@JsonKey(name: "slug") String slug,@JsonKey(name: "url") String? url,@JsonKey(name: "color") String? color
});




}
/// @nodoc
class _$SpecialityModelCopyWithImpl<$Res>
    implements $SpecialityModelCopyWith<$Res> {
  _$SpecialityModelCopyWithImpl(this._self, this._then);

  final SpecialityModel _self;
  final $Res Function(SpecialityModel) _then;

/// Create a copy of SpecialityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? url = freezed,Object? color = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpecialityModel].
extension SpecialityModelPatterns on SpecialityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecialityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecialityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecialityModel value)  $default,){
final _that = this;
switch (_that) {
case _SpecialityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecialityModel value)?  $default,){
final _that = this;
switch (_that) {
case _SpecialityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "name")  String name, @JsonKey(name: "slug")  String slug, @JsonKey(name: "url")  String? url, @JsonKey(name: "color")  String? color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecialityModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.url,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "name")  String name, @JsonKey(name: "slug")  String slug, @JsonKey(name: "url")  String? url, @JsonKey(name: "color")  String? color)  $default,) {final _that = this;
switch (_that) {
case _SpecialityModel():
return $default(_that.id,_that.name,_that.slug,_that.url,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "name")  String name, @JsonKey(name: "slug")  String slug, @JsonKey(name: "url")  String? url, @JsonKey(name: "color")  String? color)?  $default,) {final _that = this;
switch (_that) {
case _SpecialityModel() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.url,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpecialityModel implements SpecialityModel {
  const _SpecialityModel({@JsonKey(name: "id") required this.id, @JsonKey(name: "name") required this.name, @JsonKey(name: "slug") required this.slug, @JsonKey(name: "url") this.url, @JsonKey(name: "color") this.color});
  factory _SpecialityModel.fromJson(Map<String, dynamic> json) => _$SpecialityModelFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "slug") final  String slug;
@override@JsonKey(name: "url") final  String? url;
@override@JsonKey(name: "color") final  String? color;

/// Create a copy of SpecialityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecialityModelCopyWith<_SpecialityModel> get copyWith => __$SpecialityModelCopyWithImpl<_SpecialityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecialityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecialityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.url, url) || other.url == url)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,url,color);

@override
String toString() {
  return 'SpecialityModel(id: $id, name: $name, slug: $slug, url: $url, color: $color)';
}


}

/// @nodoc
abstract mixin class _$SpecialityModelCopyWith<$Res> implements $SpecialityModelCopyWith<$Res> {
  factory _$SpecialityModelCopyWith(_SpecialityModel value, $Res Function(_SpecialityModel) _then) = __$SpecialityModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "name") String name,@JsonKey(name: "slug") String slug,@JsonKey(name: "url") String? url,@JsonKey(name: "color") String? color
});




}
/// @nodoc
class __$SpecialityModelCopyWithImpl<$Res>
    implements _$SpecialityModelCopyWith<$Res> {
  __$SpecialityModelCopyWithImpl(this._self, this._then);

  final _SpecialityModel _self;
  final $Res Function(_SpecialityModel) _then;

/// Create a copy of SpecialityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? url = freezed,Object? color = freezed,}) {
  return _then(_SpecialityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
