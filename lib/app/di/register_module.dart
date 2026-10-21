import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_n_morty/common/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = String.fromEnvironment('BASE_URL');

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: baseUrl));

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  INetworkInfo get networkInfo => NetworkInfoImpl(connectivity);

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
