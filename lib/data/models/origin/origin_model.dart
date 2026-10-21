import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/domain/entities/origin.dart';

part 'origin_model.freezed.dart';
part 'origin_model.g.dart';

@freezed
abstract class OriginModel with _$OriginModel {
  const OriginModel._();

  factory OriginModel({required String? name, required String? url}) =
      _OriginModel;

  factory OriginModel.fromJson(Map<String, dynamic> json) =>
      _$OriginModelFromJson(json);

  Origin toOrigin() => Origin(name: name, url: url);
}
