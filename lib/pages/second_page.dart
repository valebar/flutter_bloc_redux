import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_redux/bloc/bloc.dart';
import 'package:flutter_bloc_redux/bloc/counter_bloc.dart';
import 'package:flutter_bloc_redux/viewmodels/page_view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (store) => PageViewModel.fromStore(store),
        builder: (BuildContext context, PageViewModel vm) {
          CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("First page"),
            ),
            body: Center(
              child: MultiBlocListener(
                listeners: [
                  BlocListener(
                    bloc: counterBloc,
                    listener: (BuildContext context, state) {
                      if (state is IncrementCounterState) {
                        vm.increment();
                      }
                      if (state is DecrementCounterState) {
                        vm.decrement();
                      }
                    },
                  )
                ],
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        counterBloc.dispatch(
                          DecrementCounterEvent(),
                        );
                      },
                    ),
                    Row(
                      children: [
                        Text("Counter: ${vm.counter}"),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        counterBloc.dispatch(
                          DecrementCounterEvent(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}