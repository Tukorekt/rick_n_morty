// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseResponseModel<T> {

 InfoModel? get info; T? get results;
/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseResponseModelCopyWith<T, BaseResponseModel<T>> get copyWith => _$BaseResponseModelCopyWithImpl<T, BaseResponseModel<T>>(this as BaseResponseModel<T>, _$identity);

  /// Serializes this BaseResponseModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  final _this = this as BaseResponseModel<T>;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseResponseModel<T>&&(identical(other.info, _this.info) || other.info == _this.info)&&const DeepCollectionEquality().equals(other.results, _this.results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BaseResponseModel<T>;
  return Object.hash(runtimeType,_this.info,const DeepCollectionEquality().hash(_this.results));
}

@override
String toString() {
  final _this = this as BaseResponseModel<T>;
  return 'BaseResponseModel<$T>(info: ${_this.info}, results: ${_this.results})';
}


}

/// @nodoc
abstract mixin class $BaseResponseModelCopyWith<T,$Res>  {
  factory $BaseResponseModelCopyWith(BaseResponseModel<T> value, $Res Function(BaseResponseModel<T>) _then) = _$BaseResponseModelCopyWithImpl;
@useResult
$Res call({
 InfoModel? info, T? results
});


$InfoModelCopyWith<$Res>? get info;

}
/// @nodoc
class _$BaseResponseModelCopyWithImpl<T,$Res>
    implements $BaseResponseModelCopyWith<T, $Res> {
  _$BaseResponseModelCopyWithImpl(this._self, this._then);

  final BaseResponseModel<T> _self;
  final $Res Function(BaseResponseModel<T>) _then;

/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = freezed,Object? results = freezed,}) {
  return _then(BaseResponseModel(
info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel?,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}
/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $InfoModelCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [BaseResponseModel].
extension BaseResponseModelPatterns<T> on BaseResponseModel<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseResponseModel<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseResponseModel<T> value)  $default,){
final _that = this;
switch (_that) {
case _BaseResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseResponseModel<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BaseResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InfoModel? info,  T? results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InfoModel? info,  T? results)  $default,) {final _that = this;
switch (_that) {
case _BaseResponseModel():
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InfoModel? info,  T? results)?  $default,) {final _that = this;
switch (_that) {
case _BaseResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BaseResponseModel<T> extends BaseResponseModel<T> {
  const _BaseResponseModel({required this.info, required this.results}): super._();
  factory _BaseResponseModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BaseResponseModelFromJson(json,fromJsonT);

@override final  InfoModel? info;
@override final  T? results;

/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseResponseModelCopyWith<T, _BaseResponseModel<T>> get copyWith => __$BaseResponseModelCopyWithImpl<T, _BaseResponseModel<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$BaseResponseModelToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseResponseModel<T>&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,info,const DeepCollectionEquality().hash(results));
}

@override
String toString() {
    return 'BaseResponseModel<$T>(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class _$BaseResponseModelCopyWith<T,$Res> implements $BaseResponseModelCopyWith<T, $Res> {
  factory _$BaseResponseModelCopyWith(_BaseResponseModel<T> value, $Res Function(_BaseResponseModel<T>) _then) = __$BaseResponseModelCopyWithImpl;
@override @useResult
$Res call({
 InfoModel? info, T? results
});


@override $InfoModelCopyWith<$Res>? get info;

}
/// @nodoc
class __$BaseResponseModelCopyWithImpl<T,$Res>
    implements _$BaseResponseModelCopyWith<T, $Res> {
  __$BaseResponseModelCopyWithImpl(this._self, this._then);

  final _BaseResponseModel<T> _self;
  final $Res Function(_BaseResponseModel<T>) _then;

/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = freezed,Object? results = freezed,}) {
  return _then(_BaseResponseModel<T>(
info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel?,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $InfoModelCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
