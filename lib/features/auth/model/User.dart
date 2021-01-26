import 'package:flutter/cupertino.dart';

class User {
  final String username = 'Test';
  final String lastname = 'Test';
  final String token;
  final String phone;

  User({@required this.phone, @required this.token});
}
