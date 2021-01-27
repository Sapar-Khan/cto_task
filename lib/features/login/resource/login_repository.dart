import 'package:cto_task/features/auth/model/User.dart';
import 'package:cto_task/features/resource/provider.dart';
import 'package:cto_task/util/conf.dart';

class LoginRepository {
  ApiProvider _provider = ApiProvider();

  Future<String> fetchLoginWithPhone(String phone) async {
    Map object = {'phone': phone, 'err_ne': false};
    Map result = await _provider.loginWithPhone(object);
    if (result.isEmpty) {
      return 's';
    }
    // return error_msg[result['error_code']] ?? 'Произошла ошибка. Попробуйте позже';
    return error_msg[result['error_code']] ?? result['error_code'];
  }

  Future<User> fetchLoginCheckSms(String phone, int code) async {
    Map object = {'phone': phone, 'sms_code': code};
    Map result = await _provider.loginCheckSms(object);
    if (result.containsKey('token')) {
      return User.parseMap(result);
    }
    throw 'error';
  }
}
