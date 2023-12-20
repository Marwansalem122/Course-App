part of 'counter_bloc.dart';

@immutable
// ignore: must_be_immutable
 class CounterState {
  int counter;
  CounterState({required this.counter});
}

// ignore: must_be_immutable
final class CounterInitial extends CounterState {
  CounterInitial():super(counter:0 );
}