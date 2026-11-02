import 'package:equatable/equatable.dart';

base class const Location({
  final int? id,
  final String? name,
  final String? type,
  final String? dimension,
  final String? url,
  final String? created,
  final List<String>? residents,
}) extends Equatable {
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
