part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthAppLoaded extends AuthEvent {}

class AuthUserLogin extends AuthEvent {}

class AuthCheckPhone extends AuthEvent {
  final phoneForServer;
  final phoneForUser;

  AuthCheckPhone({@required this.phoneForServer, @required this.phoneForUser});
}

class AuthCheckSms extends AuthEvent {
  final int smsCode;

  AuthCheckSms({@required this.smsCode});
}

class AuthBackToBase extends AuthEvent {}

class AuthUserLogout extends AuthEvent {}
