import 'package:cto_task/features/application/ui/application_page.dart';
import 'package:cto_task/features/auth/bloc/auth_bloc.dart';
import 'package:cto_task/features/login/bloc/login_bloc.dart';
import 'package:cto_task/features/login/ui/login_page.dart';
import 'package:cto_task/features/login/ui/widgets/sms_page.dart';
import 'package:cto_task/util/widgets/loading_page.dart';
import 'package:cto_task/util/widgets/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/ui/base_page.dart';

void main() {
  runApp(MyApp());
}

ThemeData appTheme = ThemeData(
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
      borderSide: BorderSide(color: Colors.green, width: 2),
    ),
  ),
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthBloc authBloc;
  LoginBloc loginBloc;

  @override
  void initState() {
    authBloc = AuthBloc()..add(AppLoaded());
    loginBloc = LoginBloc(authBloc);
    super.initState();
  }

  @override
  void dispose() {
    authBloc.close();
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => authBloc),
        BlocProvider(create: (context) => loginBloc)
      ],
      child: MaterialApp(
        routes: {
          LoginPage.routeName: (context) => LoginPage(),
          SmsPage.routeName: (context) => SmsPage(),
        },
        theme: appTheme,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return LoadingPage();
            }
            if (state is AuthSuccess) {
              return ApplicationPage();
            }
            if (state is AuthNotAuthenticated) {
              return BasePage();
            }
            return SplashPage();
          },
        ),
      ),
    );
  }
}
