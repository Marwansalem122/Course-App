import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_signup/counterapp/bloc/counter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${BlocProvider.of<CounterBloc>(context).state.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: "herotage1",
              onPressed: () =>
                  BlocProvider.of<CounterBloc>(context).add(DecrementCounter()),
              tooltip: 'Drcrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              heroTag: "herotage2",
              onPressed: () =>
                  BlocProvider.of<CounterBloc>(context).add(IncrementCounter()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
