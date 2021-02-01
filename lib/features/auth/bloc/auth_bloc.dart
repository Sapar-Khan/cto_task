import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cto_task/features/auth/model/User.dart';
import 'package:cto_task/features/auth/resource/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  AuthRepository _repository = AuthRepository();
  String phoneForServer;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthAppLoaded) {
      yield* _mapAppLoadedToState();
    }
    if (event is AuthCheckPhone) {
      yield* _mapAuthCheckPhoneToState(event);
    }
    if (event is AuthCheckSms) {
      yield* _mapAuthCheckSmsToState(event);
    }
    if (event is AuthUserLogin) {
      yield AuthUserLoginState();
    }
    if (event is AuthBackToBase) {
      yield AuthUserNotState();
    }
    if(event is AuthUserLogout){
      await _repository.removeUser();
      yield AuthUserNotState();
    }
  }

  Stream<AuthState> _mapAppLoadedToState() async* {
    yield AuthLoadingState();
    try {
      final bool isAuth = await _repository.isAuthenticated();

      if (isAuth) {
        final user = await _repository.getCurrentUser();
        yield AuthUserSuccessState(user: user);
      } else
        yield AuthUserNotState();
    } catch (e) {
      print('ERROR ------ : ${e.message}');
      yield AuthFailureState(message: e.message);
    }
  }

  Stream<AuthState> _mapAuthCheckPhoneToState(AuthCheckPhone event) async* {
    yield AuthLoadingState();
    try {
      String result =
          await _repository.fetchCheckPhoneNumber(event.phoneForServer);
      // String result = 's';
      print('result: type: ${result.runtimeType} $result');
      if (result == 's') {
        phoneForServer = event.phoneForServer;
        yield AuthUserPhoneSuccessState(phoneNumber: event.phoneForUser);
      } else {
        yield AuthFailureState(message: 'AuthCheckPhone Error $result');
      }
    } catch (e) {
      print('_mapAuthCheckPhoneToState: $e');
      yield AuthFailureState(message: "AuthCheckPhone error");
    }
  }

  Stream<AuthState> _mapAuthCheckSmsToState(AuthCheckSms event) async* {
    yield AuthLoadingState();
    try {
      String result =
          await _repository.fetchCheckSmsCode(phoneForServer, event.smsCode);
      // String result = 's';
      if (result == 's') {
        User user = await _repository.getCurrentUser();
        yield AuthUserSuccessState(user: user);
      } else {
        yield AuthFailureState(message: result);
      }
    } catch (e) {
      print('_mapAuthCheckSmsToState: $e');
      yield AuthFailureState(message: 'AuthCheckSms error');
    }
  }
}
