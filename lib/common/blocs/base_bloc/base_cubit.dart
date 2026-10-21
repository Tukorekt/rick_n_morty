import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_n_morty/common/blocs/base_bloc/base_cubit_state.dart';
import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';

abstract class BaseCubit<D extends SuccessState>
    extends Cubit<BaseCubitState<D>> {
  new(super.initialState);

  void resolveBaseEntity<T>(
    BaseEntity<T> baseEntity, {
    required void Function(AppException exception) onException,
    required void Function(T entity) onEntity,
  }) {
    if (baseEntity.entity != null) return onEntity(baseEntity.entity as T);
    if (baseEntity.exception != null) return onException(baseEntity.exception!);
  }

  Future<void> loadData();
}
