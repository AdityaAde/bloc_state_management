import 'package:bloc_state_management/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(), child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    CounterBloc cbloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text("BloC with packages"), centerTitle: true, elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, counterState) => Text(
                counterState.value.toString(),
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                    onPressed: () {
                      cbloc.add(Decrement());
                    },
                    child: Icon(Icons.arrow_downward)),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    cbloc.add(Increment());
                  },
                  child: Icon(Icons.arrow_upward),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
