import 'package:equatable/equatable.dart';

base class Location extends Equatable {
  final int? id;
  final String? name, type, dimension, url, created;
  final List<String> residents;

  const Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.url,
    required this.created,
    this.residents = const <String>[],
  });

  @override
  List<Object?> get props => [
    id,
    name,
    type,
    dimension,
    url,
    created,
    residents,
  ];
}
