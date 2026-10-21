import 'package:equatable/equatable.dart';
import 'package:rick_n_morty/domain/entities/location.dart';
import 'package:rick_n_morty/domain/entities/origin.dart';

base class Character extends Equatable {
  final int? id;
  final String? name, status, species, type, gender, image, url, created;
  final Origin? origin;
  final Location? location;
  final List<String> episodesUrls;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.url,
    required this.created,
    required this.origin,
    required this.location,
    this.episodesUrls = const <String>[],
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    type,
    gender,
    image,
    url,
    created,
    origin,
    location,
    episodesUrls,
  ];
}
