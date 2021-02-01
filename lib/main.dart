import 'package:cto_task/features/application/bloc/appl_bloc.dart';
import 'package:cto_task/features/application/ui/application_page.dart';
import 'package:cto_task/features/auth/bloc/auth_bloc.dart';
import 'package:cto_task/features/auth/ui/login_page.dart';
import 'package:cto_task/features/auth/ui/sms_page.dart';
import 'package:cto_task/features/home/ui/home_page.dart';
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
  ApplBloc applBloc;

  @override
  void initState() {
    authBloc = AuthBloc()..add(AuthAppLoaded());
    applBloc = ApplBloc();
    super.initState();
  }

  @override
  void dispose() {
    authBloc.close();
    applBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => authBloc),
        BlocProvider(create: (context) => applBloc)
      ],
      child: MaterialApp(
        theme: appTheme,
        home: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailureState) {
              print(state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return LoadingPage();
            }
            if (state is AuthUserNotState) {
              return BasePage();
            }
            if (state is AuthUserLoginState) {
              return LoginPage();
            }
            if (state is AuthUserPhoneSuccessState) {
              return SmsPage(phoneNumber: state.phoneNumber);
            }
            if (state is AuthUserSuccessState) {
              return HomePage();
            }
            return SplashPage();
          },
        ),
      ),
    );
  }
}
