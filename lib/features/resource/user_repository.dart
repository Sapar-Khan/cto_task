import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final String _key = 'authToken';
  FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<bool> isAuthenticated() async {
    String jsonString = await _storage.read(key: _key);
    if (jsonString == null) return false;
    return true;
  }
}
