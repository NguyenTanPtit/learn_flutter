import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/learn_bloc/counter_screen.dart';

import 'counter_bloc.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: CounterPage(),
      )));
}
