part of 'appl_bloc.dart';

abstract class ApplState extends Equatable {
  const ApplState();

  @override
  List<Object> get props => [];
}

class ApplInitial extends ApplState {}

class ApplLoading extends ApplState {}

class ApplSuccess extends ApplState {
  final Appl appl;

  ApplSuccess({@required this.appl});

  List<Object> get props => [appl];
}

class ApplError extends ApplState {
  final String message;

  ApplError({@required this.message});
}
