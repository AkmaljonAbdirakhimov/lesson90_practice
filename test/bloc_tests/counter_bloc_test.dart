import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesson90_practice/blocs/export_blocs.dart';

void main() {
  group("Counter Bloc", () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test("Initial State", () {
      expect(counterBloc.state, InitialCounter());
    });

    blocTest(
      "Increment Test = 1",
      build: () => counterBloc,
      act: (bloc) {
        bloc.add(IncrementCounter());
      },
      expect: () {
        return [LoadedCounter(1)];
      },
    );

    blocTest(
      "Decrement Test = 1",
      build: () => counterBloc,
      act: (bloc) {
        bloc.add(DecrementCounter());
      },
      expect: () {
        return [LoadedCounter(-1)];
      },
    );

    blocTest(
      "Increment Increment 2 Decrement 1",
      build: () => counterBloc,
      act: (bloc) {
        bloc.add(IncrementCounter());
        bloc.add(IncrementCounter());
        bloc.add(DecrementCounter());
      },
      expect: () {
        return [
          LoadedCounter(1),
          LoadedCounter(2),
          LoadedCounter(1),
        ];
      },
    );
  });
}
