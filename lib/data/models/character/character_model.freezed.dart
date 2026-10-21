// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterModel {

 int? get id; String? get name; String? get status; String? get species; String? get type; String? get gender; String? get image; String? get url; String? get created;@JsonKey(name: 'origin') OriginModel? get originModel;@JsonKey(name: 'location') LocationModel? get locationModel;@JsonKey(name: 'episode') List<String> get episodesUrls;
/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterModelCopyWith<CharacterModel> get copyWith => _$CharacterModelCopyWithImpl<CharacterModel>(this as CharacterModel, _$identity);

  /// Serializes this CharacterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CharacterModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.created, _this.created) || other.created == _this.created)&&(identical(other.originModel, _this.originModel) || other.originModel == _this.originModel)&&(identical(other.locationModel, _this.locationModel) || other.locationModel == _this.locationModel)&&const DeepCollectionEquality().equals(other.episodesUrls, _this.episodesUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CharacterModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.status,_this.species,_this.type,_this.gender,_this.image,_this.url,_this.created,_this.originModel,_this.locationModel,const DeepCollectionEquality().hash(_this.episodesUrls));
}

@override
String toString() {
  final _this = this as CharacterModel;
  return 'CharacterModel(id: ${_this.id}, name: ${_this.name}, status: ${_this.status}, species: ${_this.species}, type: ${_this.type}, gender: ${_this.gender}, image: ${_this.image}, url: ${_this.url}, created: ${_this.created}, originModel: ${_this.originModel}, locationModel: ${_this.locationModel}, episodesUrls: ${_this.episodesUrls})';
}


}

/// @nodoc
abstract mixin class $CharacterModelCopyWith<$Res>  {
  factory $CharacterModelCopyWith(CharacterModel value, $Res Function(CharacterModel) _then) = _$CharacterModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? status, String? species, String? type, String? gender, String? image, String? url, String? created,@JsonKey(name: 'origin') OriginModel? originModel,@JsonKey(name: 'location') LocationModel? locationModel,@JsonKey(name: 'episode') List<String> episodesUrls
});


$OriginModelCopyWith<$Res>? get originModel;$LocationModelCopyWith<$Res>? get locationModel;

}
/// @nodoc
class _$CharacterModelCopyWithImpl<$Res>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._self, this._then);

  final CharacterModel _self;
  final $Res Function(CharacterModel) _then;

/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? status = freezed,Object? species = freezed,Object? type = freezed,Object? gender = freezed,Object? image = freezed,Object? url = freezed,Object? created = freezed,Object? originModel = freezed,Object? locationModel = freezed,Object? episodesUrls = null,}) {
  return _then(CharacterModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,originModel: freezed == originModel ? _self.originModel : originModel // ignore: cast_nullable_to_non_nullable
as OriginModel?,locationModel: freezed == locationModel ? _self.locationModel : locationModel // ignore: cast_nullable_to_non_nullable
as LocationModel?,episodesUrls: null == episodesUrls ? _self.episodesUrls : episodesUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OriginModelCopyWith<$Res>? get originModel {
    if (_self.originModel == null) {
    return null;
  }

  return $OriginModelCopyWith<$Res>(_self.originModel!, (value) {
    return _then(_self.copyWith(originModel: value));
  });
}/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res>? get locationModel {
    if (_self.locationModel == null) {
    return null;
  }

  return $LocationModelCopyWith<$Res>(_self.locationModel!, (value) {
    return _then(_self.copyWith(locationModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [CharacterModel].
extension CharacterModelPatterns on CharacterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterModel value)  $default,){
final _that = this;
switch (_that) {
case _CharacterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterModel value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? status,  String? species,  String? type,  String? gender,  String? image,  String? url,  String? created, @JsonKey(name: 'origin')  OriginModel? originModel, @JsonKey(name: 'location')  LocationModel? locationModel, @JsonKey(name: 'episode')  List<String> episodesUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.image,_that.url,_that.created,_that.originModel,_that.locationModel,_that.episodesUrls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? status,  String? species,  String? type,  String? gender,  String? image,  String? url,  String? created, @JsonKey(name: 'origin')  OriginModel? originModel, @JsonKey(name: 'location')  LocationModel? locationModel, @JsonKey(name: 'episode')  List<String> episodesUrls)  $default,) {final _that = this;
switch (_that) {
case _CharacterModel():
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.image,_that.url,_that.created,_that.originModel,_that.locationModel,_that.episodesUrls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? status,  String? species,  String? type,  String? gender,  String? image,  String? url,  String? created, @JsonKey(name: 'origin')  OriginModel? originModel, @JsonKey(name: 'location')  LocationModel? locationModel, @JsonKey(name: 'episode')  List<String> episodesUrls)?  $default,) {final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.image,_that.url,_that.created,_that.originModel,_that.locationModel,_that.episodesUrls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterModel extends CharacterModel {
   _CharacterModel({required this.id, required this.name, required this.status, required this.species, required this.type, required this.gender, required this.image, required this.url, required this.created, @JsonKey(name: 'origin') required this.originModel, @JsonKey(name: 'location') required this.locationModel, @JsonKey(name: 'episode')  List<String> episodesUrls = const <String>[]}): _episodesUrls = episodesUrls,super._();
  factory _CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? status;
@override final  String? species;
@override final  String? type;
@override final  String? gender;
@override final  String? image;
@override final  String? url;
@override final  String? created;
@override@JsonKey(name: 'origin') final  OriginModel? originModel;
@override@JsonKey(name: 'location') final  LocationModel? locationModel;
 final  List<String> _episodesUrls;
@override@JsonKey(name: 'episode') List<String> get episodesUrls {
  if (_episodesUrls is EqualUnmodifiableListView) return _episodesUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodesUrls);
}


/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterModelCopyWith<_CharacterModel> get copyWith => __$CharacterModelCopyWithImpl<_CharacterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.image, image) || other.image == image)&&(identical(other.url, url) || other.url == url)&&(identical(other.created, created) || other.created == created)&&(identical(other.originModel, originModel) || other.originModel == originModel)&&(identical(other.locationModel, locationModel) || other.locationModel == locationModel)&&const DeepCollectionEquality().equals(other.episodesUrls, _episodesUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,status,species,type,gender,image,url,created,originModel,locationModel,const DeepCollectionEquality().hash(_episodesUrls));
}

@override
String toString() {
    return 'CharacterModel(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, image: $image, url: $url, created: $created, originModel: $originModel, locationModel: $locationModel, episodesUrls: $episodesUrls)';
}


}

/// @nodoc
abstract mixin class _$CharacterModelCopyWith<$Res> implements $CharacterModelCopyWith<$Res> {
  factory _$CharacterModelCopyWith(_CharacterModel value, $Res Function(_CharacterModel) _then) = __$CharacterModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? status, String? species, String? type, String? gender, String? image, String? url, String? created,@JsonKey(name: 'origin') OriginModel? originModel,@JsonKey(name: 'location') LocationModel? locationModel,@JsonKey(name: 'episode') List<String> episodesUrls
});


@override $OriginModelCopyWith<$Res>? get originModel;@override $LocationModelCopyWith<$Res>? get locationModel;

}
/// @nodoc
class __$CharacterModelCopyWithImpl<$Res>
    implements _$CharacterModelCopyWith<$Res> {
  __$CharacterModelCopyWithImpl(this._self, this._then);

  final _CharacterModel _self;
  final $Res Function(_CharacterModel) _then;

/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? status = freezed,Object? species = freezed,Object? type = freezed,Object? gender = freezed,Object? image = freezed,Object? url = freezed,Object? created = freezed,Object? originModel = freezed,Object? locationModel = freezed,Object? episodesUrls = null,}) {
  return _then(_CharacterModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,originModel: freezed == originModel ? _self.originModel : originModel // ignore: cast_nullable_to_non_nullable
as OriginModel?,locationModel: freezed == locationModel ? _self.locationModel : locationModel // ignore: cast_nullable_to_non_nullable
as LocationModel?,episodesUrls: null == episodesUrls ? _self._episodesUrls : episodesUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OriginModelCopyWith<$Res>? get originModel {
    if (_self.originModel == null) {
    return null;
  }

  return $OriginModelCopyWith<$Res>(_self.originModel!, (value) {
    return _then(_self.copyWith(originModel: value));
  });
}/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res>? get locationModel {
    if (_self.locationModel == null) {
    return null;
  }

  return $LocationModelCopyWith<$Res>(_self.locationModel!, (value) {
    return _then(_self.copyWith(locationModel: value));
  });
}
}

// dart format on
