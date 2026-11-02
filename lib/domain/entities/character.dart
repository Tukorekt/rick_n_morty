import 'package:equatable/equatable.dart';
import 'package:rick_n_morty/domain/entities/location.dart';
import 'package:rick_n_morty/domain/entities/origin.dart';

base class const Character({
  final int? id,
  final String? name,
  final String? status,
  final String? species,
  final String? type,
  final String? gender,
  final String? image,
  final String? url,
  final String? created,
  final Origin? origin,
  final Location? location,
  final List<String>? episodesUrls,
}) extends Equatable {
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
