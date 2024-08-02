import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialCounter()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(event, emit) {
    try {
      int value = 0;
      if (state is LoadedCounter) {
        value = (state as LoadedCounter).value;
      }
      emit(LoadedCounter(value + 1));
    } catch (e) {
      emit(ErrorCounter(e.toString()));
    }
  }

  void _decrement(event, emit) {
    try {
      int value = 0;
      if (state is LoadedCounter) {
        value = (state as LoadedCounter).value;
      }
      emit(LoadedCounter(value - 1));
    } catch (e) {
      emit(ErrorCounter(e.toString()));
    }
  }
}
