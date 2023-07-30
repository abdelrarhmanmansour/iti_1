part of 'toos_cubit.dart';

@immutable
abstract class ToosState {}

class ToosInitial extends ToosState {}

class ToosLoaing extends ToosState {}

class ToosSucces extends ToosState {}
  
class ToosError extends ToosState {}

