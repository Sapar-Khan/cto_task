import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cto_task/features/auth/bloc/auth_bloc.dart';
import 'package:cto_task/features/auth/model/User.dart';
import 'package:cto_task/features/login/resource/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthBloc _authBloc;
  LoginBloc(AuthBloc authBloc)
      : assert(authBloc != null),
        _authBloc = authBloc,
        super(LoginInitial());

  LoginRepository _repository = LoginRepository();
  String _phoneNumber;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSendPhone) {
      yield* _mapLoginSendPhoneToState(event);
    }

    if (event is LoginSendSmsCode) {
      yield* _mapLoginSendSmsCodeToState(event);
    }

    if(event is LoginToPhone){
      yield LoginInitial();
    }
  }

  Stream<LoginState> _mapLoginSendPhoneToState(LoginSendPhone event) async* {
    yield LoginLoading();
    try {
      _phoneNumber = event.phoneToServer;
      String result = await _repository.fetchLoginWithPhone(_phoneNumber);

      if (result == 's')
        yield LoginSuccessPhone(phoneNumber: event.phoneToShow);
      else
        yield LoginFailurePhone(message: result);
    } catch (e) {
      
      print('Error: $e');
      yield LoginFailure();
    }
  }

  Stream<LoginState> _mapLoginSendSmsCodeToState(
      LoginSendSmsCode event) async* {
    yield LoginLoading();
    try {
      Map result =
          await _repository.fetchLoginCheckSms(_phoneNumber, event.smsCode);
      if (result['sts'] == 's') {
        _authBloc.add(UserLoggedIn(userData: result['dat']));
        yield LoginSuccessSmsCode();
        yield LoginInitial();
      }
      else{
        yield LoginFailureSmsCode(message: result['dat']);
      }
    }
    catch (e) {
      print('Error: $e');
      yield LoginFailure();
    }
  }
}
