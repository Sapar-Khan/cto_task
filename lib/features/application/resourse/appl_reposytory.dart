import 'package:cto_task/features/application/model/appl_item.dart';
import 'package:cto_task/features/application/model/dict_model.dart';
import 'package:cto_task/features/resource/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class ApplReposytory {
  ApiProvider _apiProvider = ApiProvider();
  FlutterSecureStorage _storage = FlutterSecureStorage();
  Appl appl;
  Dict dict;
  int page = 1;
  int pageSize = 1;
  int kind = 1;
  int cityId = 34;

  Future<void> fetchDict() async {
    dynamic result = await _apiProvider.getDictionary();
    if (result.runtimeType != String) {
      dict = Dict.fromJson(result);
    }
  }

  Future<void> fetchCurrentDict() async {
    dynamic result = await _apiProvider.getCurrentDictionary(dict.hs);
    if (result.runtimeType != String && result['data'] == null) {
      print(result);
    } else {
      print(result);
    }
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
      // print(result);
      appl = Appl.fromJson(result);
      print(appl.results[0]);
      return null;
    } catch (e) {
      print('Error fetchApplItems: $e');
      return 'Произошла ошибка. Попробуйте позже';
    }
  }
}
