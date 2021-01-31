part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthUserNotState extends AuthState {}

class AuthUserLoginState extends AuthState {}

class AuthUserPhoneSuccessState extends AuthState {
  final String phoneNumber;

  AuthUserPhoneSuccessState({@required this.phoneNumber});
}

class AuthUserSuccessState extends AuthState {
  final User user;

  AuthUserSuccessState({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFailureState extends AuthState {
  final String message;

  AuthFailureState({@required this.message});

  @override
  List<Object> get props => [message];
}
