// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speciality_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpecialityEntity {

 int get id; String get name; String get slug; String? get url; String? get color;
/// Create a copy of SpecialityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecialityEntityCopyWith<SpecialityEntity> get copyWith => _$SpecialityEntityCopyWithImpl<SpecialityEntity>(this as SpecialityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.url, url) || other.url == url)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,url,color);

@override
String toString() {
  return 'SpecialityEntity(id: $id, name: $name, slug: $slug, url: $url, color: $color)';
}


}

/// @nodoc
abstract mixin class $SpecialityEntityCopyWith<$Res>  {
  factory $SpecialityEntityCopyWith(SpecialityEntity value, $Res Function(SpecialityEntity) _then) = _$SpecialityEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, String? url, String? color
});




}
/// @nodoc
class _$SpecialityEntityCopyWithImpl<$Res>
    implements $SpecialityEntityCopyWith<$Res> {
  _$SpecialityEntityCopyWithImpl(this._self, this._then);

  final SpecialityEntity _self;
  final $Res Function(SpecialityEntity) _then;

/// Create a copy of SpecialityEntity
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


/// Adds pattern-matching-related methods to [SpecialityEntity].
extension SpecialityEntityPatterns on SpecialityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecialityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecialityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecialityEntity value)  $default,){
final _that = this;
switch (_that) {
case _SpecialityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecialityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SpecialityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String? url,  String? color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecialityEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  String? url,  String? color)  $default,) {final _that = this;
switch (_that) {
case _SpecialityEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  String? url,  String? color)?  $default,) {final _that = this;
switch (_that) {
case _SpecialityEntity() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.url,_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _SpecialityEntity implements SpecialityEntity {
  const _SpecialityEntity({required this.id, required this.name, required this.slug, this.url, this.color});
  

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  String? url;
@override final  String? color;

/// Create a copy of SpecialityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecialityEntityCopyWith<_SpecialityEntity> get copyWith => __$SpecialityEntityCopyWithImpl<_SpecialityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecialityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.url, url) || other.url == url)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,slug,url,color);

@override
String toString() {
  return 'SpecialityEntity(id: $id, name: $name, slug: $slug, url: $url, color: $color)';
}


}

/// @nodoc
abstract mixin class _$SpecialityEntityCopyWith<$Res> implements $SpecialityEntityCopyWith<$Res> {
  factory _$SpecialityEntityCopyWith(_SpecialityEntity value, $Res Function(_SpecialityEntity) _then) = __$SpecialityEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, String? url, String? color
});




}
/// @nodoc
class __$SpecialityEntityCopyWithImpl<$Res>
    implements _$SpecialityEntityCopyWith<$Res> {
  __$SpecialityEntityCopyWithImpl(this._self, this._then);

  final _SpecialityEntity _self;
  final $Res Function(_SpecialityEntity) _then;

/// Create a copy of SpecialityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? url = freezed,Object? color = freezed,}) {
  return _then(_SpecialityEntity(
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
