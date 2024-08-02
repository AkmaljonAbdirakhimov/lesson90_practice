part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {}

final class InitialCounter extends CounterState {
  @override
  List<Object?> get props => [];
}

final class LoadedCounter extends CounterState {
  final int value;

  LoadedCounter(this.value);

  @override
  List<Object?> get props => [value];
}

final class ErrorCounter extends CounterState {
  final String message;

  ErrorCounter(this.message);

  @override
  List<Object?> get props => [message];
}
