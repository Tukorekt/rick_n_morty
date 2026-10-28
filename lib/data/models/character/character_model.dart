import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/data/models/location/location_model.dart';
import 'package:rick_n_morty/data/models/origin/origin_model.dart';
import 'package:rick_n_morty/domain/entities/character.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
abstract class CharacterModel with _$CharacterModel {
  const CharacterModel._();

  factory CharacterModel({
    required int? id,
    required String? name,
    required String? status,
    required String? species,
    required String? type,
    required String? gender,
    required String? image,
    required String? url,
    required String? created,
    @JsonKey(name: 'origin') required OriginModel? originModel,
    @JsonKey(name: 'location') required LocationModel? locationModel,
    @JsonKey(name: 'episode') @Default(<String>[]) List<String> episodesUrls,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Character get toCharacter => Character(
    id: id,
    name: name,
    status: status,
    species: species,
    type: type,
    gender: gender,
    image: image,
    url: url,
    created: created,
    origin: originModel?.toOrigin,
    location: locationModel?.toLocation,
    episodesUrls: episodesUrls,
  );
}
