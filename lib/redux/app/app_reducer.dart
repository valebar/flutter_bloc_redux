import 'package:flutter_bloc_redux/redux/app/app_state.dart';
import '../counter/counter_reducer.dart';

AppState appReducer(AppState state, dynamic action) => new AppState(
      counterState: counterReducer(state.counterState, action),
    );
