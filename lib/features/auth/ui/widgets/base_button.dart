import 'package:flutter/material.dart';

class BaseButtons extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final Function callback;

  const BaseButtons(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.subtitle,
      @required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xFF48ca64),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: callback,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle:
            Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 14)),
      ),
    );
  }
}
