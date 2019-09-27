import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_redux/bloc/counter_bloc.dart';
import 'package:flutter_bloc_redux/pages/first_page.dart';

void main() => runApp(
      MultiBlocProvider(
        child: MyApp(),
        providers: [
          BlocProvider<CounterBloc>(
            builder: (context) => CounterBloc(),
          ),
        ],
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc - Redux Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}
