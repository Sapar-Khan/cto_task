import 'package:cto_task/util/conf.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  Map<String, dynamic> header = {"Content-Type": "application/json"};
  Future<Map<String, dynamic>> loginWithPhone(
      Map<String, dynamic> object) async {
    http.Response response;
    try {
      final url = '$baseApiUrl/profile/send_validating_code';
      // final url = '';
      final payload = json.encode(object);
      print('payload: $payload');
      response = await http.post(url, body: payload);
    } catch (e) {
      print('Error loginWithPhone: $e');
      throw 'Произошла ошибка. Попробуйте позже';
    }

    print('stateus code: ${response.statusCode}');
    if (response.statusCode == 200) {
      return json.decode(response.body) ?? {};
    }

    throw 'Произошла ошибка. Попробуйте позже';
  }

  Future<Map> loginCheckSms(Map object) async {
    http.Response response;

    try {
      final String url = '$baseApiUrl/profile/auth_reg';
      final String payload = json.encode(object);
      response = await http.post(url, body: payload);
    } catch (e) {
      print('Error loginCheckSms: $e');
      throw 'Произошла ошибка. Попробуйте позже';
    }

    if (response.statusCode == 200) return json.decode(response.body);

    throw 'Произошла ошибка. Попробуйте позже';
  }

  Future<Map> getApplItems(
      {@required int page,
      @required int pageSize,
      @required int kind,
      @required int cityId}) async {
    http.Response response;

    try {
      print("yesy");
      response = await http.get(
          'https://ctogram.kz/api/ads?page=$page&page_size=$pageSize?kind=$kind?city_id=$cityId',
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'ca5ff1bc05f264c766692d36b75d1a91cb90bb2fa17571b74af1fc66e1ba694ea087691319e14deb388a88a1fc1d72af9c44e997eadfea73dd50fc75042cfacb'
          });
    } catch (e) {
      print('Error getApplItems: $e');
      throw 'Произошла ошибка. Попробуйте позже';
    }
    print(response.statusCode);
    if (response.statusCode == 200) json.decode(response.body);

    throw 'Произошла ошибка. Попробуйте позже';
  }
}
