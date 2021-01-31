import 'package:cto_task/util/conf.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  Map<String, dynamic> header = {"Content-Type": "application/json"};
  Future<dynamic> loginWithPhone(Map<String, dynamic> object) async {
    print('LoginWithPhone');
    http.Response response;
    try {
      final url = '$baseApiUrl/profile/send_validating_code';
      final payload = json.encode(object);
      response = await http.post(url, body: payload);
    } catch (e) {
      print('Error loginWithPhone: $e');
      return 'Произошла ошибка. Попробуйте позже';
    }

    if (response.statusCode == 200) {
      return (response.body.runtimeType == String && response.body.length > 0)
          ? {}
          : json.decode(response.body);
    } else {
      print('response status: ${response.statusCode}');
    }

    return 'Произошла ошибка. Попробуйте позже';
  }

  Future<dynamic> loginCheckSms(Map object) async {
    print('LoginCheckSms');
    http.Response response;

    try {
      final String url = '$baseApiUrl/profile/auth_reg';
      final String payload = json.encode(object);
      response = await http.post(url, body: payload);
    } catch (e) {
      print('Error loginCheckSms: $e');
      return 'Произошла ошибка. Попробуйте позже';
    }

    if (response.statusCode == 200) return json.decode(response.body);

    return 'Произошла ошибка. Попробуйте позже';
  }

  Future<dynamic> getDictionary() async {
    print('getDictionary');
    http.Response response;
    Map dict;

    try {
      final String url = '$baseApiUrl/api/dic';
      response = await http.get(url);
    } catch (e) {
      print('Error loginCheckSms: $e');
      return 'Произошла ошибка. Попробуйте позже';
    }

    if (response.statusCode == 200) return json.decode(response.body);

    return 'Произошла ошибка. Попробуйте позже';
  }

  Future<dynamic> getCurrentDictionary(String hs) async {
    print('getDictionary');
    http.Response response;
    Map dict;

    try {
      final String url = '$baseApiUrl/api/dic?hs=$hs';
      response = await http.get(url);
    } catch (e) {
      print('Error loginCheckSms: $e');
      return 'Произошла ошибка. Попробуйте позже';
    }

    if (response.statusCode == 200) return response.body;

    return 'Произошла ошибка. Попробуйте позже';
  }

  Future<Map> getApplItems(
      {@required int page,
      @required int pageSize,
      @required int kind,
      @required int cityId,
      @required String token}) async {
    print('getApplItems');
    http.Response response;

    try {
      print("$token $page $pageSize, $kind, $cityId");
      // response = await http.get('https://www.google.com');
      response = await http.get(
          'https://ctogram.kz/api/ads?page=$page&page_size=$pageSize&kind=$kind',
          headers: {'Authorization': '$token'});
    } catch (e) {
      print('Error getApplItems: $e');
      throw 'Произошла ошибка. Попробуйте позже';
    }

    if (response.statusCode == 200) {
      print("sts 200");
      return json.decode(response.body);
    } else {
      print('sts: ${response.statusCode}');
    }

    throw 'Произошла ошибка. Попробуйте позже';
  }
}
