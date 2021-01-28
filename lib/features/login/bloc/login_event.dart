part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginToPhone extends LoginEvent{}

class LoginSendPhone extends LoginEvent {
  final String phoneToServer;
  final String phoneToShow;

  LoginSendPhone({@required this.phoneToServer, @required this.phoneToShow});

  @override
  List<Object> get props => [phoneToServer, phoneToShow];
}

class LoginSendSmsCode extends LoginEvent {
  final int smsCode;

  LoginSendSmsCode({@required this.smsCode});

  @override
  List<Object> get props => [smsCode];
}
