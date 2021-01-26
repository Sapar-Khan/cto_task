import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cto_task/features/auth/model/User.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState();
    }
    if (event is UserLoggedIn) {}

    if (event is UserLoggedOut) {}
  }
}

Stream<AuthState> _mapAppLoadedToState() async* {
  yield AuthLoading();
}
