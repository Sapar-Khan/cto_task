import 'package:cto_task/features/application/ui/application_page.dart';
import 'package:cto_task/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          ApplicationPage(),
          Center(
              child: Container(
            width: 250,
            height: 40,
            child: RaisedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(AuthUserLogout());
                },
                child: Text('Выйти'),
                textColor: Colors.white,
                color: Colors.redAccent),
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color(0xFFf3f5fa),
        fixedColor: Color(0xFF48ca64),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.app_blocking),
            label: 'Заявки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Кабинет',
          )
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
