import 'package:flutter_bloc/flutter_bloc.dart';

class Counter {
  int? value;

  Counter({this.value});
}

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<Counter> {
  /// {@macro counter_cubit}
  CounterCubit() : super(Counter(value: 0));

  /// Add 1 to the current state.
  void increment() => emit(Counter(value: state.value! + 1));

  /// Subtract 1 from the current state.
  // void decrement() => emit(state - 1);
}
