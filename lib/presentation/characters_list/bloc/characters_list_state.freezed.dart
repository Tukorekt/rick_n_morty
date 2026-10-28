// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharactersListState {

 List<Character> get characters; Info? get info;
/// Create a copy of CharactersListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersListStateCopyWith<CharactersListState> get copyWith => _$CharactersListStateCopyWithImpl<CharactersListState>(this as CharactersListState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CharactersListState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersListState&&const DeepCollectionEquality().equals(other.characters, _this.characters)&&(identical(other.info, _this.info) || other.info == _this.info));
}


@override
int get hashCode {
  final _this = this as CharactersListState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.characters),_this.info);
}

@override
String toString() {
  final _this = this as CharactersListState;
  return 'CharactersListState(characters: ${_this.characters}, info: ${_this.info})';
}


}

/// @nodoc
abstract mixin class $CharactersListStateCopyWith<$Res>  {
  factory $CharactersListStateCopyWith(CharactersListState value, $Res Function(CharactersListState) _then) = _$CharactersListStateCopyWithImpl;
@useResult
$Res call({
 List<Character> characters, Info? info
});




}
/// @nodoc
class _$CharactersListStateCopyWithImpl<$Res>
    implements $CharactersListStateCopyWith<$Res> {
  _$CharactersListStateCopyWithImpl(this._self, this._then);

  final CharactersListState _self;
  final $Res Function(CharactersListState) _then;

/// Create a copy of CharactersListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? characters = null,Object? info = freezed,}) {
  return _then(CharactersListState(
characters: null == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as List<Character>,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Info?,
  ));
}

}


/// Adds pattern-matching-related methods to [CharactersListState].
extension CharactersListStatePatterns on CharactersListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharactersListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharactersListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharactersListState value)  $default,){
final _that = this;
switch (_that) {
case _CharactersListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharactersListState value)?  $default,){
final _that = this;
switch (_that) {
case _CharactersListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Character> characters,  Info? info)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharactersListState() when $default != null:
return $default(_that.characters,_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Character> characters,  Info? info)  $default,) {final _that = this;
switch (_that) {
case _CharactersListState():
return $default(_that.characters,_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Character> characters,  Info? info)?  $default,) {final _that = this;
switch (_that) {
case _CharactersListState() when $default != null:
return $default(_that.characters,_that.info);case _:
  return null;

}
}

}

/// @nodoc


class _CharactersListState extends CharactersListState {
   _CharactersListState({ List<Character> characters = const <Character>[], this.info}): _characters = characters,super._();
  

 final  List<Character> _characters;
@override@JsonKey() List<Character> get characters {
  if (_characters is EqualUnmodifiableListView) return _characters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characters);
}

@override final  Info? info;

/// Create a copy of CharactersListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersListStateCopyWith<_CharactersListState> get copyWith => __$CharactersListStateCopyWithImpl<_CharactersListState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharactersListState&&const DeepCollectionEquality().equals(other.characters, _characters)&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_characters),info);
}

@override
String toString() {
    return 'CharactersListState(characters: $characters, info: $info)';
}


}

/// @nodoc
abstract mixin class _$CharactersListStateCopyWith<$Res> implements $CharactersListStateCopyWith<$Res> {
  factory _$CharactersListStateCopyWith(_CharactersListState value, $Res Function(_CharactersListState) _then) = __$CharactersListStateCopyWithImpl;
@override @useResult
$Res call({
 List<Character> characters, Info? info
});




}
/// @nodoc
class __$CharactersListStateCopyWithImpl<$Res>
    implements _$CharactersListStateCopyWith<$Res> {
  __$CharactersListStateCopyWithImpl(this._self, this._then);

  final _CharactersListState _self;
  final $Res Function(_CharactersListState) _then;

/// Create a copy of CharactersListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? characters = null,Object? info = freezed,}) {
  return _then(_CharactersListState(
characters: null == characters ? _self._characters : characters // ignore: cast_nullable_to_non_nullable
as List<Character>,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Info?,
  ));
}


}

// dart format on
