part of 'appl_bloc.dart';

abstract class ApplState extends Equatable {
  const ApplState();

  @override
  List<Object> get props => [];
}

class ApplInitial extends ApplState {}

class ApplLoading extends ApplState {}

class ApplSuccess extends ApplState {
  final List<Appl> items;

  ApplSuccess({@required this.items});
}

class ApplError extends ApplState {
  final String error;

  ApplError({@required this.error});
}
