part of 'counter_bloc.dart';

sealed class CounterEvent {}

final class IncrementCounter extends CounterEvent {}

final class DecrementCounter extends CounterEvent {}
