import 'package:redux/redux.dart';
import 'counter_state.dart';
import 'counter_actions.dart';

final counterReducer = combineReducers<CounterState>(
  [
    TypedReducer<CounterState, SetCounterAction>(_setCounterAction),
    TypedReducer<CounterState, IncrementCounterAction>(_incrementCounterAction),
    TypedReducer<CounterState, DecrementCounterAction>(_decrementCounterAction),
  ],
);

CounterState _setCounterAction(CounterState state, SetCounterAction action) =>
    state.copyWith(counter: action.counter);

CounterState _incrementCounterAction(
        CounterState state, IncrementCounterAction action) =>
    state.copyWith(counter: state.counter + 1);

CounterState _decrementCounterAction(
        CounterState state, DecrementCounterAction action) =>
    state.copyWith(counter: state.counter - 1);
