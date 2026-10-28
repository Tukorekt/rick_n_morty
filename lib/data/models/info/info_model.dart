import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/domain/entities/info.dart';

part 'info_model.freezed.dart';
part 'info_model.g.dart';

@freezed
abstract class InfoModel with _$InfoModel {
  const InfoModel._();

  factory InfoModel({
    required int? count,
    required int? pages,
    String? next,
    String? prev,
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  Info get toInfo => Info(count: count, pages: pages, next: next, prev: prev);
}
