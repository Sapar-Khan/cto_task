import 'package:cto_task/features/auth/model/User.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final String _key = 'auth_user';
  FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<bool> isAuthenticated() async {
    String jsonString = await _storage.read(key: _key);
    if (jsonString == null) return false;
    return true;
  }

  Future<User> getCurrentUser() async {
    String jsonString = await _storage.read(key: _key);
    if (jsonString != null) return User.parseJson(jsonString);
    return null;
  }
}
