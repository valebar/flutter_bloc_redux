import 'app/app_reducer.dart';
import 'app/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

Store<AppState> createStore() {
  AppState appState = AppState.inital();
  return Store(
    appReducer,
    initialState: appState ?? AppState.inital(),
    middleware: [
      LoggingMiddleware.printer(),
    ],
  );
}
