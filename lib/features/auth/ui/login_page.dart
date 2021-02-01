import 'package:cto_task/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  MaskTextInputFormatter _phoneController;

  @override
  void initState() {
    _phoneController = MaskTextInputFormatter(
        mask: "+# (###)-###-####", filter: {"#": RegExp(r'[0-9]')});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
          onPressed: () {
            _closeKeyBoard();
            BlocProvider.of<AuthBloc>(context).add(AuthBackToBase());
          },
        ),
      ),
      body: SafeArea(minimum: EdgeInsets.all(16), child: _bodyWidget()),
    );
  }

  Widget _bodyWidget() {
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
              if (value.isEmpty) return 'Поле не может быть пустым';
              if (value.length < 17) return 'Неверный формат';
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
            onPressed: _onPressLogin,
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

  void _onPressLogin() {
    _closeKeyBoard();

    if (_key.currentState.validate()) {
      String phoneForUser = _phoneController.getMaskedText();
      String phoneForServer = _phoneController.getUnmaskedText();
      BlocProvider.of<AuthBloc>(context).add(AuthCheckPhone(
          phoneForServer: phoneForServer, phoneForUser: phoneForUser));
    }
  }

  void _closeKeyBoard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
  }
}
