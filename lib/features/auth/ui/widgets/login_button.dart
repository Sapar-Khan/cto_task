import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Function callback;

  const LoginButton({Key key, @required this.title, @required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: TextButton(
          onPressed: callback,
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.green),
            textAlign: TextAlign.center,
          )),
    );
  }
}
