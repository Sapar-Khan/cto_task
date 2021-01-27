import 'package:cto_task/util/conf.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiProvider {
  Map _header = {"Content-Type": "application/json"};
  Future<Map> loginWithPhone(Map object) async {
    http.Response response;
    // try {
    //   final url = '$baseApiUrl/profile/send_validating_code';
    //   final payload = convert.jsonEncode(object);
    //   response = await http.post(url, body: payload, headers: _header);
    // } catch (e) {
    //   print('ERROR ${e.message}');
    //   throw 'Произошла внутренняя ошибка сервера. Попробуйте позже';
    // }

    // if (response.statusCode == 200) {
    //   return convert.jsonDecode(response.body);
    // }
    return {};
    // throw 'Произошла внутренняя ошибка сервера. Попробуйте позже';
  }

  Future<Map> loginCheckSms(Map object) async {
    http.Response response;

    // try {
    //   final String url = '$baseApiUrl/profile/auth_reg';
    //   final String payload = convert.jsonEncode(object);
    //   response = await http.post(url, body: payload, headers: _header);
    // } catch (e) {
    //   print('Error: ${e.message}');
    //   throw 'Произошла внутренняя ошибка сервера. Попробуйте позже';
    // }

    // if (response.statusCode == 200) return convert.jsonDecode(response.body);
    return {"error": "error"};

    // throw 'Произошла внутренняя ошибка сервера. Попробуйте позже';
  }
}
