import 'package:equatable/equatable.dart';

base class Origin extends Equatable {
  final String? name, url;

  const Origin({required this.name, required this.url});

  @override
  List<Object?> get props => [name, url];
}
