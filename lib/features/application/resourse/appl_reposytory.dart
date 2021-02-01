import 'package:cto_task/features/application/model/appl_item.dart';
import 'package:cto_task/features/application/model/dict_model.dart';
import 'package:cto_task/features/provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class ApplReposytory {
  ApiProvider _apiProvider = ApiProvider();
  FlutterSecureStorage _storage = FlutterSecureStorage();
  Appl appl;
  Dict dict;
  int page = 1;
  int pageSize = 30;
  int kind = 2;
  int cityId = 34;
  Map<int, String> test = new Map<int, String>();

  Future<void> fetchDict() async {
    try {
      dynamic result = await _apiProvider.getDictionary();
      dict = Dict.fromJson(result);
    } catch (e) {
      print('fetchDict Error: $e');
    }
  }

  Future<void> fetchCurrentDict() async {
    dynamic result = await _apiProvider.getCurrentDictionary(dict.hs);
    if (result.runtimeType != String && result['data'] == null)
      print(result);
    else
      print(result);
  }

  Future<dynamic> fetchApplItems() async {
    try {
      String jsonString = await _storage.read(key: 'auth_user');
      Map jsonData = json.decode(jsonString);
      String token = jsonData['token'];
      Map result = await _apiProvider.getApplItems(
          page: page,
          pageSize: pageSize,
          kind: kind,
          cityId: cityId,
          token: token);
      appl = Appl.fromJson(result, dict.data.getCityes());
      page++;
      return appl;
    } catch (e) {
      print('fetchApplItems Error: $e');
      return 'Произошла ошибка. Попробуйте позже';
    }
  }
}
