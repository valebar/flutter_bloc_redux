import 'package:flutter_bloc_redux/redux/app/app_state.dart';
import 'package:flutter_bloc_redux/redux/counter/counter_actions.dart';
import 'package:redux/redux.dart';

class PageViewModel {
  final int counter;
  final Function() increment;
  final Function() decrement;
  PageViewModel({
    this.counter,
    this.increment,
    this.decrement,
  });

  @override
  int get hashCode => counter.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageViewModel &&
          runtimeType == other.runtimeType &&
          counter == other.counter;

  factory PageViewModel.fromStore(Store<AppState> store) {
    return PageViewModel(
      counter: store.state.counterState.counter,
      increment: () => store.dispatch(IncrementCounterAction()),
      decrement: () => store.dispatch(DecrementCounterAction()),
    );
  }
}
