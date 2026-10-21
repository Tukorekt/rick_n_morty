import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/data/datasources/data_converter_mixin.dart';
import 'package:rick_n_morty/data/models/base_response/base_response.dart';
import 'package:rick_n_morty/data/models/character/character_model.dart';

abstract interface class ICharactersApi {
  Future<List<CharacterModel>> getCharacters(int page);
  Future<List<CharacterModel>> searchCharacters((String name, int page) params);
}

@LazySingleton(as: ICharactersApi)
class CharactersApiImpl
    with ConverterMixin, BaseResponseMixin
    implements ICharactersApi {
  final Dio dio;

  const CharactersApiImpl(this.dio);

  BaseResponseModel<List<CharacterModel>> _convertFromResponse(
    dynamic jsonList,
  ) => BaseResponseModel<List<CharacterModel>>.fromJson(
    jsonList,
    (v) => (v as List<dynamic>).map((e) => CharacterModel.fromJson(e)).toList(),
  );

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
    final result = await handleResponse(
      () => dio.get('/character/', queryParameters: {'page': page}),
      _convertFromResponse,
    );

    return result.results ?? <CharacterModel>[];
  }

  @override
  Future<List<CharacterModel>> searchCharacters((String, int) params) async {
    final result = await handleResponse(
      () => dio.get(
        '/character/',
        queryParameters: {'page': params.$2, 'name': params.$1},
      ),
      _convertFromResponse,
    );

    return result.results ?? <CharacterModel>[];
  }
}
