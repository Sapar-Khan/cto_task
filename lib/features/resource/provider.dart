import 'package:cto_task/util/conf.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  Map _header = {"Content-Type": "application/json"};
  Future<Map<String, dynamic>> loginWithPhone(
      Map<String, dynamic> object) async {
    print(object);
    http.Response response;
    try {
      final url = '$baseApiUrl/profile/send_validating_code';
      String payload = json.encode(object);
      response = await http.post(url, body: payload);
      
    } catch (e) {
      print('ERROR ------- $e');
      // return {};
      // throw 'Произошла ошибка. Попробуйте позже';
    }
    if (response.statusCode == 200)
        return json.decode(response.body);
      else
        print('status code: response');

    // throw 'Произошла ошибка. Попробуйте позже';
  }

  Future<Map> loginCheckSms(Map object) async {
    http.Response response;

    try {
      final String url = '$baseApiUrl/profile/auth_reg';
      final String payload = json.encode(object);
      response = await http.post(url, body: payload, headers: _header);
    } catch (e) {
      print('Error: e');
      // throw 'Произошла ошибка. Попробуйте позже';
    }

    if (response.statusCode == 200) return json.decode(response.body);

    // throw 'Произошла ошибка. Попробуйте позже';
  }
}
