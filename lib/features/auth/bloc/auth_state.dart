part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthNotAuthenticated extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
