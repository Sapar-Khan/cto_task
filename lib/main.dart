import 'package:cto_task/features/application/ui/application_page.dart';
import 'package:cto_task/features/login/ui/login_page.dart';
import 'package:flutter/material.dart';

import 'features/base/ui/base_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFFf3f5fa),
          scaffoldBackgroundColor: Color(0xFFf3f5fa),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green, width: 2)))),
      routes: {
        '/': (context) => ApplicationPage(),
        LoginPage.routeName: (context) => LoginPage()
      },
      initialRoute: '/',
    );
  }
}
