import 'package:equatable/equatable.dart';

class IncrementState extends Equatable {
  int counter;
  IncrementState({this.counter = 0});

  //update

  IncrementState copyWith({int? counter}) {
    return IncrementState(
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object?> get props => [counter];
}
