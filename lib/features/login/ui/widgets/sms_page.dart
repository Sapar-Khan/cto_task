import 'package:flutter/material.dart';

class SmsPage extends StatefulWidget {
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
        foregroundColor: Colors.green,
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
    return Column(
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
              textAlign: TextAlign.center,
              controller: _smsCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '# # # #',
              ),
            ),
          ),
        )
      ],
    );
  }
}
