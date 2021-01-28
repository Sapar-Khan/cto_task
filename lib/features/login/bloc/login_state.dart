part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessPhone extends LoginState {
  final String phoneNumber;

  LoginSuccessPhone({@required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class LoginFailurePhone extends LoginState {
  final String message;

  LoginFailurePhone({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoginSuccessSmsCode extends LoginState {}

class LoginFailureSmsCode extends LoginState {
  final String message;

  LoginFailureSmsCode({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
