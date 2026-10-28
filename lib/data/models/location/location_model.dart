import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/domain/entities/location.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
sealed class LocationModel with _$LocationModel {
  const LocationModel._();

  factory LocationModel({
    required int? id,
    required String? name,
    required String? type,
    required String? dimension,
    required String? url,
    required String? created,
    @Default(<String>[]) List<String> residents,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Location get toLocation => Location(
    id: id,
    name: name,
    type: type,
    dimension: dimension,
    url: url,
    created: created,
    residents: residents,
  );
}
