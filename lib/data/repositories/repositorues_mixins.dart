import 'dart:async';

import 'package:rick_n_morty/common/errors/exceptions.dart';
import 'package:rick_n_morty/common/network/network_info.dart';
import 'package:rick_n_morty/domain/entities/base_entity.dart';

abstract interface class IModelToEntityConverter<I, O> {
  BaseEntity<O> convertToEntity(I modelResponse);
}

mixin ResolveMixin<I, O> implements IModelToEntityConverter<I, O> {
  INetworkInfo get networkInfo;

  Future<BaseEntity<O>> resolveLoading({
    required FutureOr<BaseEntity<O>> Function() loadApi,
    FutureOr<BaseEntity<O>> Function()? loadLocal,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        return await loadApi();
      } else if (loadLocal != null) {
        return await loadLocal();
      }
      return BaseEntity();
    } on AppException catch (e) {
      return BaseEntity(exception: e);
    } on Exception catch (e) {
      return BaseEntity(exception: AppException.fromException(e));
    }
  }
}
