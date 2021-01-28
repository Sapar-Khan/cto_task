part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends AuthEvent {}

class UserLoggedIn extends AuthEvent {
  final Map userData;

  UserLoggedIn({@required this.userData});

  @override
  List<Object> get props => [userData];
}

class UserLoggedOut extends AuthEvent {}
