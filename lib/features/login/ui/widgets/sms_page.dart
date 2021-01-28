import 'package:cto_task/features/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmsPage extends StatefulWidget {
  static const String routeName = 'smsPage';
  @override
  _SmsPageState createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  final GlobalKey _key = GlobalKey<FormState>();
  final TextEditingController _smsCodeController = TextEditingController();

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
        child: _bodyWidget(),
      ),
    );
  }

  Widget _bodyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Введите код',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Мы отправили его на номер',
            style: TextStyle(color: Color(0xFF8092bf), fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '+7 (702) 999-0503',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          SizedBox(
            height: 40,
          ),
          Form(
            key: _key,
            child: Container(
              width: 200,
              child: TextFormField(
                maxLength: 4,
                onChanged: (value) {
                  try {
                    if (value.length == 4) {
                      BlocProvider.of<LoginBloc>(context)
                          .add(LoginSendSmsCode(smsCode: int.parse(value)));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                textAlign: TextAlign.center,
                controller: _smsCodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '# # # #',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
