import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';

part 'base_cubit_state.freezed.dart';

@freezed
sealed class BaseCubitState<T extends SuccessState> with _$BaseCubitState<T> {
  const BaseCubitState._();

  factory BaseCubitState.success({required T state, int? timeStamp}) =
      Success<T>;

  factory BaseCubitState.failure({
    required AppException exception,
    int? timeStamp,
  }) = Failure<T>;

  factory BaseCubitState.loading({int? timeStamp}) = Loading<T>;

  factory BaseCubitState.init({int? timeStamp}) = Init<T>;
}

abstract class SuccessState<T> {
  List<T> get contentList;

  const SuccessState();
}
