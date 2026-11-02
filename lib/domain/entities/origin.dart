import 'package:equatable/equatable.dart';

base class const Origin({final String? name, final String? url})
    extends Equatable {
  @override
  List<Object?> get props => [name, url];
}
