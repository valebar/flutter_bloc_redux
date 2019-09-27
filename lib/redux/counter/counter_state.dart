import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable(nullable: true)
@immutable
class CounterState {
  final int counter;

  CounterState({
    @required this.counter,
  });

  factory CounterState.initial() {
    return new CounterState(
      counter: 0,
    );
  }

  @override
  int get hashCode => counter.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter;

  CounterState copyWith({
    int counter,
  }) {
    return new CounterState(
      counter: counter ?? this.counter,
    );
  }
}
