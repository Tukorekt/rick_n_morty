import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/data/models/info/info.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponseModel<T> with _$BaseResponseModel<T> {
  const factory BaseResponseModel({
    required InfoModel? info,
    required T? results,
  }) = _BaseResponseModel<T>;

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) => _$BaseResponseModelFromJson<T>(json, fromJsonT);
}
