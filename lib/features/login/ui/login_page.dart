import 'package:cto_task/features/login/bloc/login_bloc.dart';
import 'package:cto_task/features/login/ui/widgets/phone_page.dart';
import 'package:cto_task/features/login/ui/widgets/sms_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        print("loginFailur");
      }
    }, builder: (context, state) {
      if (state is LoginSuccessPhone) {
        return SmsPage();
      }
      return PhonePage();
    });
  }
}
