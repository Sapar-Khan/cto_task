import 'package:cto_task/features/login/bloc/login_bloc.dart';
import 'package:cto_task/features/login/ui/widgets/sms_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
          onPressed: () {
            
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          minimum: EdgeInsets.all(16),
          child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginFailurePhone) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message), backgroundColor: Colors.red));
                }
                if (state is LoginSuccessPhone) {
                  Navigator.pushNamed(context, SmsPage.routeName);
                }
              },
              child: _bodyWidget())),
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
              String showPhone = _phoneController.getMaskedText();
              String phone = _phoneController.getUnmaskedText();
              FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
              BlocProvider.of<LoginBloc>(context).add(
                  LoginSendPhone(phoneToServer: phone, phoneToShow: showPhone));
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
