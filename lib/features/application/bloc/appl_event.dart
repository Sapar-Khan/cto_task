part of 'appl_bloc.dart';

abstract class ApplEvent extends Equatable {
  const ApplEvent();

  @override
  List<Object> get props => [];
}

class AppLoad extends ApplEvent {}

class ApplLoadItem extends ApplEvent {}
