import 'package:cto_task/features/login/ui/login_page.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 280),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: ListTile(
                          leading: Icon(
                            Icons.verified_user,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Страховка',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFe65459),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    '10% скидка',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                )
                              ]),
                          subtitle: Text('Расчет и оплата',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LoginButton(
                              title: 'Я СТО или продаю запчасти',
                              callback: () {},
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFFdee3f0), width: 0.7)),
                            ),
                            LoginButton(
                              title: 'Войти',
                              callback: () {
                                Navigator.pushNamed(
                                    context, LoginPage.routeName);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
