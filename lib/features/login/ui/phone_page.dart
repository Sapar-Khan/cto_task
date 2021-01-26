import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final GlobalKey _key = GlobalKey<FormState>();
  MaskTextInputFormatter _phoneController;

  @override
  void initState() {
    _phoneController = MaskTextInputFormatter(
        mask: "+# (###)-###-####", filter: {"#": RegExp(r'[0-9]')});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ВХОД",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Form(
          key: _key,
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: '+ Ваш номер телефона'),
            inputFormatters: [_phoneController],
            validator: (value) {
              if (value.isEmpty) return "This input can not empty";
              return null;
            },
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          width: double.infinity,
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: RaisedButton(
            color: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              print(_phoneController.getMaskedText());
              String phone = _phoneController.getUnmaskedText();
              print(phone);
            },
            child: Text(
              'Войти',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Нажимая «Войти» вы соглашаетесь с',
          style: TextStyle(fontSize: 14, color: Color(0xFF8092bf)),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'политикой конфеденциальности',
              style: TextStyle(color: Color(0xFF48ca64), fontSize: 14),
            ))
      ],
    );
  }
}
