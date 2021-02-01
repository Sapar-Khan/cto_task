import 'package:cto_task/util/conf.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  Future<Map> loginWithPhone(Map<String, dynamic> object) async {
    print('LoginWithPhone');
    http.Response response;
    try {
      final url = '$baseApiUrl/profile/send_validating_code';
      final payload = json.encode(object);
      response = await http.post(url, body: payload);
    } catch (e) {
      print('Error loginWithPhone: $e');
      throw err_msg;
    }

    if (response.statusCode == 200)
      return (response.body is String && response.body.length == 0)
          ? {}
          : json.decode(response.body);

    throw err_msg;
  }

  Future<Map> loginCheckSms(Map object) async {
    print('LoginCheckSms');
    http.Response response;

    try {
      final String url = '$baseApiUrl/profile/auth_reg';
      final String payload = json.encode(object);
      response = await http.post(url, body: payload);
    } catch (e) {
      print('Error loginCheckSms: $e');
      throw err_msg;
    }

    if (response.statusCode == 200) return json.decode(response.body);

    throw err_msg;
  }

  Future<dynamic> getDictionary() async {
    print('getDictionary');
    http.Response response;

    try {
      final String url = '$baseApiUrl/dic';
      response = await http.get(url);
    } catch (e) {
      print('Error loginCheckSms: $e');
      throw err_msg;
    }
    if (response.statusCode == 200) return json.decode(response.body);

    throw err_msg;
  }

  Future<dynamic> getCurrentDictionary(String hs) async {
    print('getDictionary');
    http.Response response;

    try {
      final String url = '$baseApiUrl/dic?hs=$hs';
      response = await http.get(url);
    } catch (e) {
      print('Error loginCheckSms: $e');
      throw err_msg;
    }

    if (response.statusCode == 200) return response.body;

    throw err_msg;
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
      response = await http.get(
          '$baseApiUrl/ads?page=$page&page_size=$pageSize&kind=$kind',
          headers: {'Authorization': '$token'});
    } catch (e) {
      print('Error getApplItems: $e');
      throw err_msg;
    }

    if (response.statusCode == 200) return json.decode(response.body);

    throw err_msg;
  }
}
