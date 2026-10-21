// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseEntity<T> {

 AppException? get exception; T? get entity;
/// Create a copy of BaseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseEntityCopyWith<T, BaseEntity<T>> get copyWith => _$BaseEntityCopyWithImpl<T, BaseEntity<T>>(this as BaseEntity<T>, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BaseEntity<T>;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseEntity<T>&&(identical(other.exception, _this.exception) || other.exception == _this.exception)&&const DeepCollectionEquality().equals(other.entity, _this.entity));
}


@override
int get hashCode {
  final _this = this as BaseEntity<T>;
  return Object.hash(runtimeType,_this.exception,const DeepCollectionEquality().hash(_this.entity));
}

@override
String toString() {
  final _this = this as BaseEntity<T>;
  return 'BaseEntity<$T>(exception: ${_this.exception}, entity: ${_this.entity})';
}


}

/// @nodoc
abstract mixin class $BaseEntityCopyWith<T,$Res>  {
  factory $BaseEntityCopyWith(BaseEntity<T> value, $Res Function(BaseEntity<T>) _then) = _$BaseEntityCopyWithImpl;
@useResult
$Res call({
 AppException? exception, T? entity
});




}
/// @nodoc
class _$BaseEntityCopyWithImpl<T,$Res>
    implements $BaseEntityCopyWith<T, $Res> {
  _$BaseEntityCopyWithImpl(this._self, this._then);

  final BaseEntity<T> _self;
  final $Res Function(BaseEntity<T>) _then;

/// Create a copy of BaseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exception = freezed,Object? entity = freezed,}) {
  return _then(BaseEntity(
exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as AppException?,entity: freezed == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseEntity].
extension BaseEntityPatterns<T> on BaseEntity<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseEntity<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseEntity<T> value)  $default,){
final _that = this;
switch (_that) {
case _BaseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseEntity<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BaseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppException? exception,  T? entity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseEntity() when $default != null:
return $default(_that.exception,_that.entity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppException? exception,  T? entity)  $default,) {final _that = this;
switch (_that) {
case _BaseEntity():
return $default(_that.exception,_that.entity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppException? exception,  T? entity)?  $default,) {final _that = this;
switch (_that) {
case _BaseEntity() when $default != null:
return $default(_that.exception,_that.entity);case _:
  return null;

}
}

}

/// @nodoc


class _BaseEntity<T> extends BaseEntity<T> {
   _BaseEntity({this.exception, this.entity}): super._();
  

@override final  AppException? exception;
@override final  T? entity;

/// Create a copy of BaseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseEntityCopyWith<T, _BaseEntity<T>> get copyWith => __$BaseEntityCopyWithImpl<T, _BaseEntity<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseEntity<T>&&(identical(other.exception, exception) || other.exception == exception)&&const DeepCollectionEquality().equals(other.entity, entity));
}


@override
int get hashCode {
    return Object.hash(runtimeType,exception,const DeepCollectionEquality().hash(entity));
}

@override
String toString() {
    return 'BaseEntity<$T>(exception: $exception, entity: $entity)';
}


}

/// @nodoc
abstract mixin class _$BaseEntityCopyWith<T,$Res> implements $BaseEntityCopyWith<T, $Res> {
  factory _$BaseEntityCopyWith(_BaseEntity<T> value, $Res Function(_BaseEntity<T>) _then) = __$BaseEntityCopyWithImpl;
@override @useResult
$Res call({
 AppException? exception, T? entity
});




}
/// @nodoc
class __$BaseEntityCopyWithImpl<T,$Res>
    implements _$BaseEntityCopyWith<T, $Res> {
  __$BaseEntityCopyWithImpl(this._self, this._then);

  final _BaseEntity<T> _self;
  final $Res Function(_BaseEntity<T>) _then;

/// Create a copy of BaseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exception = freezed,Object? entity = freezed,}) {
  return _then(_BaseEntity<T>(
exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as AppException?,entity: freezed == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
