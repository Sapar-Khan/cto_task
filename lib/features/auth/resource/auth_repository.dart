import 'dart:convert';
import 'package:cto_task/features/provider/provider.dart';
import 'package:cto_task/util/conf.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final String _key = 'auth_user';
  FlutterSecureStorage _storage = FlutterSecureStorage();
  ApiProvider _provider = ApiProvider();

  Future<bool> isAuthenticated() async {
    String jsonString = await _storage.read(key: _key);
    if (jsonString == null) return false;
    return true;
  }

  Future<Map> getCurrentUser() async {
    final jsonString = await _storage.read(key: _key);
    return json.decode(jsonString);
  }

  Future<void> removeUser() async {
    await _storage.deleteAll();
  }

  Future<String> fetchCheckPhoneNumber(String phone) async {
    try {
      Map<String, dynamic> object = {'phone': phone, 'err_ne': false};
      Map<String, dynamic> result = await _provider.loginWithPhone(object);

      return (result.isEmpty)
          ? 's'
          : (error_msg[result['error_code']] ?? result['error_code']);
    } catch (e) {
      print('fetchCheckPhoneNumber $e');
      return err_msg;
    }
  }

  Future<String> fetchCheckSmsCode(String phone, int code) async {
    try {
      Map object = {'phone': phone, 'sms_code': code};
      Map result = await _provider.loginCheckSms(object);

      if (result.containsKey('token')) {
        await _storage.write(key: _key, value: json.encode(result));
        return 's';
      }
      return error_msg[result['error_code']] ?? result['error_code'];
    } catch (e) {
      print('fetchCheckSmsCode $e');
      return err_msg;
    }
  }
}
