import 'package:expackpro/bloc/increment_event.dart';
import 'package:expackpro/bloc/increment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  IncrementBloc() : super(IncrementState()) {
    on<AddEvent>((event, emit) => _mapAddLogic(event, emit));
    on<Subtract>((event, emit) => _subtractLogic(event, emit));
  }

  _mapAddLogic(AddEvent event, Emitter<IncrementState> emit) {
    final updatedData = state.counter + 1;
    emit(state.copyWith(counter: updatedData));
  }

  _subtractLogic(Subtract event, Emitter<IncrementState> emit) {
    final updatedData = state.counter - 1;
    emit(state.copyWith(counter: updatedData));
  }
}
