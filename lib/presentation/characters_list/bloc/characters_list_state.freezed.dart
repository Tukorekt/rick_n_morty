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

 List<Character> get characters;
/// Create a copy of CharactersListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersListStateCopyWith<CharactersListState> get copyWith => _$CharactersListStateCopyWithImpl<CharactersListState>(this as CharactersListState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CharactersListState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersListState&&const DeepCollectionEquality().equals(other.characters, _this.characters));
}


@override
int get hashCode {
  final _this = this as CharactersListState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.characters));
}

@override
String toString() {
  final _this = this as CharactersListState;
  return 'CharactersListState(characters: ${_this.characters})';
}


}

/// @nodoc
abstract mixin class $CharactersListStateCopyWith<$Res>  {
  factory $CharactersListStateCopyWith(CharactersListState value, $Res Function(CharactersListState) _then) = _$CharactersListStateCopyWithImpl;
@useResult
$Res call({
 List<Character> characters
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
@pragma('vm:prefer-inline') @override $Res call({Object? characters = null,}) {
  return _then(CharactersListState(
characters: null == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as List<Character>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Character> characters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharactersListState() when $default != null:
return $default(_that.characters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Character> characters)  $default,) {final _that = this;
switch (_that) {
case _CharactersListState():
return $default(_that.characters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Character> characters)?  $default,) {final _that = this;
switch (_that) {
case _CharactersListState() when $default != null:
return $default(_that.characters);case _:
  return null;

}
}

}

/// @nodoc


class _CharactersListState extends CharactersListState {
   _CharactersListState({ List<Character> characters = const <Character>[]}): _characters = characters,super._();
  

 final  List<Character> _characters;
@override@JsonKey() List<Character> get characters {
  if (_characters is EqualUnmodifiableListView) return _characters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characters);
}


/// Create a copy of CharactersListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersListStateCopyWith<_CharactersListState> get copyWith => __$CharactersListStateCopyWithImpl<_CharactersListState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharactersListState&&const DeepCollectionEquality().equals(other.characters, _characters));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_characters));
}

@override
String toString() {
    return 'CharactersListState(characters: $characters)';
}


}

/// @nodoc
abstract mixin class _$CharactersListStateCopyWith<$Res> implements $CharactersListStateCopyWith<$Res> {
  factory _$CharactersListStateCopyWith(_CharactersListState value, $Res Function(_CharactersListState) _then) = __$CharactersListStateCopyWithImpl;
@override @useResult
$Res call({
 List<Character> characters
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
@override @pragma('vm:prefer-inline') $Res call({Object? characters = null,}) {
  return _then(_CharactersListState(
characters: null == characters ? _self._characters : characters // ignore: cast_nullable_to_non_nullable
as List<Character>,
  ));
}


}

// dart format on
