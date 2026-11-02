import 'package:equatable/equatable.dart';

base class const Info({
  final int? count,
  final int? pages,
  final String? next,
  final String? prev,
}) extends Equatable {
  @override
  List<Object?> get props => [count, next, pages, prev];
}
