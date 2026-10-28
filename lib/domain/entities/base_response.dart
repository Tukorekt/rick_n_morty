import 'package:equatable/equatable.dart';
import 'package:rick_n_morty/domain/entities/info.dart';

class BaseResponse<T> extends Equatable {
  final Info? info;
  final T? results;

  const new({this.info, this.results});

  @override
  List<Object?> get props => [info, results];
}
