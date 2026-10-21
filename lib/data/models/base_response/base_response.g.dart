// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _BaseResponseModel<T>(
  info: json['info'] == null
      ? null
      : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  results: _$nullableGenericFromJson(json['results'], fromJsonT),
);

Map<String, dynamic> _$BaseResponseModelToJson<T>(
  _BaseResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'info': instance.info,
  'results': _$nullableGenericToJson(instance.results, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
