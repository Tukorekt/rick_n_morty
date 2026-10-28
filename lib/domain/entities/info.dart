import 'package:equatable/equatable.dart';

class Info extends Equatable {
  final int? count, pages;
  final String? next, prev;

  const Info({this.count, this.next, this.pages, this.prev});

  @override
  List<Object?> get props => [count, next, pages, prev];
}
