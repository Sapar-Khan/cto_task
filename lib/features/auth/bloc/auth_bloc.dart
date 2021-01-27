import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cto_task/features/auth/model/User.dart';
import 'package:cto_task/features/resource/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  UserRepository _repository = UserRepository();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState();
    }
    if (event is UserLoggedIn) {

    }

    if (event is UserLoggedOut) {

    }
  }

  Stream<AuthState> _mapAppLoadedToState() async* {
    yield AuthInitial();
    try {
      final bool isAuth = await _repository.isAuthenticated();
      print('isAuth: $isAuth');
      if (isAuth) {
        final user = await _repository.getCurrentUser();
        yield AuthSuccess(user: user);
      } else {
        yield AuthNotAuthenticated();
      }
    } catch (e) {
      print('ERROR: ${e.message}');
      yield AuthFailure(message: e.message);
    }
  }
}
