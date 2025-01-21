import 'package:equatable/equatable.dart';

abstract class IncrementEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddEvent extends IncrementEvent {
  @override
  List<Object?> get props => [];
}

class Subtract extends IncrementEvent {
  @override
  List<Object?> get props => [];
}
