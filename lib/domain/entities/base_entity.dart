import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';

part 'base_entity.freezed.dart';

@freezed
abstract class BaseEntity<T> with _$BaseEntity<T> {
  const BaseEntity._();

  factory BaseEntity({AppException? exception, T? entity}) = _BaseEntity<T>;
}
