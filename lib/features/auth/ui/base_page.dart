import 'package:cto_task/features/auth/bloc/auth_bloc.dart';
import 'package:cto_task/features/auth/ui/widgets/base_button.dart';
import 'package:cto_task/features/auth/ui/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/aha.png'),
          )),
          child: Column(
            children: [
              SizedBox(height: (screenHeight / 2) - 120),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Найди СТО или запчасть за 3 минуты',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BaseButtons(
                          icon: Icon(
                            Icons.home,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: 'Отправить заявку',
                          subtitle: 'Получить цены от свободных',
                          callback: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BaseButtons(
                          icon: Icon(
                            Icons.linked_camera_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: 'Штрафы ПДД',
                          subtitle: 'Проверка и оплата',
                          callback: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          color: Color(0xFFa6b1d3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {},
                          child: _buttonWithSale(),
                        ),
                        SizedBox(height: 10),
                        _loginButtons(context)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoginButton(
          title: 'Я СТО или продаю запчасти',
          callback: () {},
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFdee3f0), width: 0.7)),
        ),
        LoginButton(
          title: 'Войти',
          callback: () {
            BlocProvider.of<AuthBloc>(context).add(AuthUserLogin());
          },
        ),
      ],
    );
  }

  Widget _buttonWithSale() {
    return ListTile(
      leading: Icon(
        Icons.verified_user,
        size: 50,
        color: Colors.white,
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Страховка',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
              color: Color(0xFFe65459),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            '10% скидка',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        )
      ]),
      subtitle: Text('Расчет и оплата',
          style: TextStyle(color: Colors.white, fontSize: 14)),
    );
  }
}
