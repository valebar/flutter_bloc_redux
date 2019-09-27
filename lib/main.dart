import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_redux/bloc/counter_bloc.dart';
import 'package:flutter_bloc_redux/pages/first_page.dart';
import 'package:flutter_bloc_redux/redux/app/app_state.dart';
import 'package:flutter_bloc_redux/redux/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  var store = createStore();
  runApp(
    MultiBlocProvider(
      child: MyApp(store),
      providers: [
        BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp(this.store);
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Bloc - Redux Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstPage(),
      ),
    );
  }
}
