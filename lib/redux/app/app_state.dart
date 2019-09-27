import 'package:flutter_bloc_redux/redux/counter/counter_state.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false, anyMap: true, checked: true)
@immutable
class AppState {
  final CounterState counterState;

  AppState({
    @required this.counterState,
  });

  factory AppState.inital() {
    return AppState(
      counterState: CounterState.initial(),
    );
  }

  AppState copyWith({
    CounterState authState,
  }) {
    return AppState(
      counterState: authState ?? this.counterState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          counterState == other.counterState;

  @override
  int get hashCode => counterState.hashCode;
}
