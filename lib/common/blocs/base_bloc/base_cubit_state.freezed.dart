// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseCubitState<T extends SuccessState<dynamic>> {

 int? get timeStamp;
/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseCubitStateCopyWith<T, BaseCubitState<T>> get copyWith => _$BaseCubitStateCopyWithImpl<T, BaseCubitState<T>>(this as BaseCubitState<T>, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BaseCubitState<T>;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseCubitState<T>&&(identical(other.timeStamp, _this.timeStamp) || other.timeStamp == _this.timeStamp));
}


@override
int get hashCode {
  final _this = this as BaseCubitState<T>;
  return Object.hash(runtimeType,_this.timeStamp);
}

@override
String toString() {
  final _this = this as BaseCubitState<T>;
  return 'BaseCubitState<$T>(timeStamp: ${_this.timeStamp})';
}


}

/// @nodoc
abstract mixin class $BaseCubitStateCopyWith<T extends SuccessState<dynamic>,$Res>  {
  factory $BaseCubitStateCopyWith(BaseCubitState<T> value, $Res Function(BaseCubitState<T>) _then) = _$BaseCubitStateCopyWithImpl;
@useResult
$Res call({
 int? timeStamp
});




}
/// @nodoc
class _$BaseCubitStateCopyWithImpl<T extends SuccessState<dynamic>,$Res>
    implements $BaseCubitStateCopyWith<T, $Res> {
  _$BaseCubitStateCopyWithImpl(this._self, this._then);

  final BaseCubitState<T> _self;
  final $Res Function(BaseCubitState<T>) _then;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeStamp = freezed,}) {
  return _then(_self.copyWith(
timeStamp: freezed == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseCubitState].
extension BaseCubitStatePatterns<T extends SuccessState<dynamic>> on BaseCubitState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Success<T> value)?  success,TResult Function( Failure<T> value)?  failure,TResult Function( Loading<T> value)?  loading,TResult Function( Init<T> value)?  init,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case Loading() when loading != null:
return loading(_that);case Init() when init != null:
return init(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Success<T> value)  success,required TResult Function( Failure<T> value)  failure,required TResult Function( Loading<T> value)  loading,required TResult Function( Init<T> value)  init,}){
final _that = this;
switch (_that) {
case Success():
return success(_that);case Failure():
return failure(_that);case Loading():
return loading(_that);case Init():
return init(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Success<T> value)?  success,TResult? Function( Failure<T> value)?  failure,TResult? Function( Loading<T> value)?  loading,TResult? Function( Init<T> value)?  init,}){
final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case Loading() when loading != null:
return loading(_that);case Init() when init != null:
return init(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T state,  int? timeStamp)?  success,TResult Function( AppException exception,  int? timeStamp)?  failure,TResult Function( int? timeStamp)?  loading,TResult Function( int? timeStamp)?  init,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that.state,_that.timeStamp);case Failure() when failure != null:
return failure(_that.exception,_that.timeStamp);case Loading() when loading != null:
return loading(_that.timeStamp);case Init() when init != null:
return init(_that.timeStamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T state,  int? timeStamp)  success,required TResult Function( AppException exception,  int? timeStamp)  failure,required TResult Function( int? timeStamp)  loading,required TResult Function( int? timeStamp)  init,}) {final _that = this;
switch (_that) {
case Success():
return success(_that.state,_that.timeStamp);case Failure():
return failure(_that.exception,_that.timeStamp);case Loading():
return loading(_that.timeStamp);case Init():
return init(_that.timeStamp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T state,  int? timeStamp)?  success,TResult? Function( AppException exception,  int? timeStamp)?  failure,TResult? Function( int? timeStamp)?  loading,TResult? Function( int? timeStamp)?  init,}) {final _that = this;
switch (_that) {
case Success() when success != null:
return success(_that.state,_that.timeStamp);case Failure() when failure != null:
return failure(_that.exception,_that.timeStamp);case Loading() when loading != null:
return loading(_that.timeStamp);case Init() when init != null:
return init(_that.timeStamp);case _:
  return null;

}
}

}

/// @nodoc


class Success<T extends SuccessState<dynamic>> extends BaseCubitState<T> {
   Success({required this.state, this.timeStamp}): super._();
  

 final  T state;
@override final  int? timeStamp;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<T, Success<T>> get copyWith => _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<T>&&const DeepCollectionEquality().equals(other.state, state)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(state),timeStamp);
}

@override
String toString() {
    return 'BaseCubitState<$T>.success(state: $state, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<T extends SuccessState<dynamic>,$Res> implements $BaseCubitStateCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) _then) = _$SuccessCopyWithImpl;
@override @useResult
$Res call({
 T state, int? timeStamp
});




}
/// @nodoc
class _$SuccessCopyWithImpl<T extends SuccessState<dynamic>,$Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? timeStamp = freezed,}) {
  return _then(Success<T>(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as T,timeStamp: freezed == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class Failure<T extends SuccessState<dynamic>> extends BaseCubitState<T> {
   Failure({required this.exception, this.timeStamp}): super._();
  

 final  AppException exception;
@override final  int? timeStamp;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<T, Failure<T>> get copyWith => _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure<T>&&(identical(other.exception, exception) || other.exception == exception)&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,exception,timeStamp);
}

@override
String toString() {
    return 'BaseCubitState<$T>.failure(exception: $exception, timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<T extends SuccessState<dynamic>,$Res> implements $BaseCubitStateCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) _then) = _$FailureCopyWithImpl;
@override @useResult
$Res call({
 AppException exception, int? timeStamp
});




}
/// @nodoc
class _$FailureCopyWithImpl<T extends SuccessState<dynamic>,$Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<T> _self;
  final $Res Function(Failure<T>) _then;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exception = null,Object? timeStamp = freezed,}) {
  return _then(Failure<T>(
exception: null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as AppException,timeStamp: freezed == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class Loading<T extends SuccessState<dynamic>> extends BaseCubitState<T> {
   Loading({this.timeStamp}): super._();
  

@override final  int? timeStamp;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<T, Loading<T>> get copyWith => _$LoadingCopyWithImpl<T, Loading<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,timeStamp);
}

@override
String toString() {
    return 'BaseCubitState<$T>.loading(timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<T extends SuccessState<dynamic>,$Res> implements $BaseCubitStateCopyWith<T, $Res> {
  factory $LoadingCopyWith(Loading<T> value, $Res Function(Loading<T>) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 int? timeStamp
});




}
/// @nodoc
class _$LoadingCopyWithImpl<T extends SuccessState<dynamic>,$Res>
    implements $LoadingCopyWith<T, $Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading<T> _self;
  final $Res Function(Loading<T>) _then;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeStamp = freezed,}) {
  return _then(Loading<T>(
timeStamp: freezed == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class Init<T extends SuccessState<dynamic>> extends BaseCubitState<T> {
   Init({this.timeStamp}): super._();
  

@override final  int? timeStamp;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitCopyWith<T, Init<T>> get copyWith => _$InitCopyWithImpl<T, Init<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Init<T>&&(identical(other.timeStamp, timeStamp) || other.timeStamp == timeStamp));
}


@override
int get hashCode {
    return Object.hash(runtimeType,timeStamp);
}

@override
String toString() {
    return 'BaseCubitState<$T>.init(timeStamp: $timeStamp)';
}


}

/// @nodoc
abstract mixin class $InitCopyWith<T extends SuccessState<dynamic>,$Res> implements $BaseCubitStateCopyWith<T, $Res> {
  factory $InitCopyWith(Init<T> value, $Res Function(Init<T>) _then) = _$InitCopyWithImpl;
@override @useResult
$Res call({
 int? timeStamp
});




}
/// @nodoc
class _$InitCopyWithImpl<T extends SuccessState<dynamic>,$Res>
    implements $InitCopyWith<T, $Res> {
  _$InitCopyWithImpl(this._self, this._then);

  final Init<T> _self;
  final $Res Function(Init<T>) _then;

/// Create a copy of BaseCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeStamp = freezed,}) {
  return _then(Init<T>(
timeStamp: freezed == timeStamp ? _self.timeStamp : timeStamp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
