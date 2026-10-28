import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/data/models/info/info_model.dart';
import 'package:rick_n_morty/domain/entities/base_response.dart';

part 'base_response_model.freezed.dart';
part 'base_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponseModel<T> with _$BaseResponseModel<T> {
  const BaseResponseModel._();

  const factory BaseResponseModel({
    required InfoModel? info,
    required T? results,
  }) = _BaseResponseModel<T>;

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) => _$BaseResponseModelFromJson<T>(json, fromJsonT);

  BaseResponse<R> toBaseResponse<R>(R Function(T model) convert) =>
      BaseResponse(
        info: info?.toInfo,
        results: results != null ? convert(results as T) : null,
      );
}
