import 'dart:convert';

import 'package:flutter/cupertino.dart';

class User {
  final String username = 'Test';
  final String lastname = 'Test';
  final String token;
  final int id;

  User({@required this.token, @required this.id});

  factory User.parseJson(Map<String, dynamic> object) {
    return User(id: object['id'], token: object['token']);
  }

  @override
  String toString() {
    Map object = {'id': this.id, 'token': this.token};
    return json.encode(object);
  }
}
