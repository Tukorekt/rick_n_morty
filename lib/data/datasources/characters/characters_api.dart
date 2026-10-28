import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/common/typedefs.dart';
import 'package:rick_n_morty/data/datasources/data_converter_mixin.dart';
import 'package:rick_n_morty/data/models/base_response/base_response_model.dart';
import 'package:rick_n_morty/data/models/character/character_model.dart';

typedef CharactersModelResponse = BaseResponseModel<List<CharacterModel>>;

abstract interface class ICharactersApi {
  Future<CharactersModelResponse> getCharacters(int page);
  Future<CharactersModelResponse> searchCharacters(
    (String name, int page) params,
  );
}

@LazySingleton(as: ICharactersApi)
class CharactersApiImpl
    with ConverterMixin<List<CharacterModel>>
    implements ICharactersApi {
  final Dio dio;

  const CharactersApiImpl(this.dio);

  @override
  Future<CharactersModelResponse> getCharacters(int page) => handleResponse(
    () => dio.get('/character/', queryParameters: {'page': page}),
  );

  @override
  Future<CharactersModelResponse> searchCharacters((String, int) params) =>
      handleResponse(
        () => dio.get(
          '/character/',
          queryParameters: {'page': params.$2, 'name': params.$1},
        ),
      );

  @override
  BaseResponseModel<List<CharacterModel>> responseToModel(JSON json) =>
      BaseResponseModel<List<CharacterModel>>.fromJson(
        json,
        (v) => (v as List<dynamic>)
            .map((e) => CharacterModel.fromJson(e))
            .toList(),
      );
}
