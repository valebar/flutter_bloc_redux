import 'package:meta/meta.dart';

@immutable
abstract class CounterState {}

class InitialCounterState extends CounterState {}

class IncrementCounterState extends CounterState {}

class DecrementCounterState extends CounterState {}
