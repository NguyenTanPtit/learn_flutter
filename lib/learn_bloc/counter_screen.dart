import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/learn_bloc/counter_event.dart';

import 'counter_bloc.dart';
import 'counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("BloC"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  "Counter: ${state.counter}",
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              counterBloc.add(IncrementEvent());
            },
            child: const Text("Increment"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              counterBloc.add(DecrementEvent());
            },
            child: const Text("Decrement"),
          ),
        ],
      ),
    );
  }
}
