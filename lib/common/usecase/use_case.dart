import 'package:rick_n_morty/domain/entities/base_entity.dart';

abstract interface class UseCase<T, P> {
  Future<BaseEntity<T>> call(P params);
}
