import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_redux/bloc/bloc.dart';
import 'package:flutter_bloc_redux/bloc/counter_bloc.dart';
import 'package:flutter_bloc_redux/pages/second_page.dart';
import 'package:flutter_bloc_redux/redux/app/app_state.dart';
import 'package:flutter_bloc_redux/viewmodels/page_view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PageViewModel>(
      converter: (store) => PageViewModel.fromStore(store),
      builder: (BuildContext context, PageViewModel vm) {
        CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("First page"),
          ),
          body: MultiBlocListener(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        counterBloc.dispatch(
                          DecrementCounterEvent(),
                        );
                      },
                    ),
                    Text("Counter: ${vm.counter}"),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        counterBloc.dispatch(
                          IncrementCounterEvent(),
                        );
                      },
                    ),
                  ],
                ),
                MaterialButton(
                  child: Text("Second Page"),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
