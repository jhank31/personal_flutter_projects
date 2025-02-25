part of 'counter_bloc.dart';

abstract class CounterEvents {}

final class IncrementEvent extends CounterEvents {}

final class DecrementEvent extends CounterEvents {}
