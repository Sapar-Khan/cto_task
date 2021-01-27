import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';

class User {
  final String username = 'Test';
  final String lastname = 'Test';
  final String token;
  final int userId;

  User({@required this.token, @required this.userId});

  factory User.parseJson(String jsonString) {
    Map object = convert.jsonDecode(jsonString);
    return User(userId: object['id'], token: object['token']);
  }

  factory User.parseMap(Map object) {
    return User(userId: object['id'], token: object['token']);
  }

  @override
  String toString() {
    Map object = {
      'id': this.userId,
      'token': this.token
    };
    return convert.jsonEncode(object);
  }
}
