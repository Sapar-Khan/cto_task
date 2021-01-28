import 'dart:convert';

import 'package:cto_task/features/auth/model/User.dart';
import 'package:cto_task/features/resource/provider.dart';
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

  Future<String> fetchLoginWithPhone(String phone) async {
    try {
      Map<String, dynamic> object = {'phone': phone, 'err_ne': false};
      Map<String, dynamic> result = await _provider.loginWithPhone(object);
      print(result);
      if (result.isEmpty) {
        return 's';
      }
      // return error_msg[result['error_code']] ?? 'Произошла ошибка. Попробуйте позже';
      return error_msg[result['error_code']] ?? result['error_code'];
    } catch (e) {
      print('Error fetchLoginWithPhone: $e');
      throw e;
    }
  }

  Future<String> fetchLoginCheckSms(String phone, int code) async {
    Map object = {'phone': '77022966496', 'sms_code': code};
    Map result = await _provider.loginCheckSms(object);
    print(result);
    if (result.containsKey('token')) {
      await _storage.write(key: _key, value: json.encode(result));
      return 's';
    }
    return error_msg[result['error_code']] ?? result['error_code'];
  }

  Future<User> getCurrentUser() async {
    try {
      final jsonString = await _storage.read(key: _key);
      if (jsonString != null) return User.parseJson(json.decode(jsonString));
    } catch (e) {
      print('getCurrentUser: $e');
    }
    return null;
  }

  Future<void> removeUser() async {
    await _storage.deleteAll();
  }
}
