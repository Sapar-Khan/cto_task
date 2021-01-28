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

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState();
    }
    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield AuthLoading();
      await _repository.removeUser();
      yield AuthNotAuthenticated();
    }
  }

  Stream<AuthState> _mapAppLoadedToState() async* {
    yield AuthLoading();
    try {
      final bool isAuth = await _repository.isAuthenticated();

      if (isAuth) {
        final user = await _repository.getCurrentUser();
        yield AuthSuccess(user: user);
      } else {
        yield AuthNotAuthenticated();
      }
    } catch (e) {
      print('ERROR ------ : ${e.message}');
      yield AuthFailure(message: e.message);
    }
  }

  Stream<AuthState> _mapUserLoggedInToState(UserLoggedIn event) async* {
    yield AuthLoading();
    try {
      User user = await _repository.getCurrentUser();
      yield AuthSuccess(user: user);
    } catch (_) {
      AuthFailure(message: 'Error');
    }
  }
}
