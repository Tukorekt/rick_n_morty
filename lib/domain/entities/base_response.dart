import 'package:equatable/equatable.dart';
import 'package:rick_n_morty/domain/entities/info.dart';

base class const BaseResponse<T>({final Info? info, final T? results})
    extends Equatable {
  @override
  List<Object?> get props => [info, results];
}
