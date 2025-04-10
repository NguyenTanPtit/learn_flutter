import 'package:flutter/material.dart';

class TimerStreamWidget extends StatelessWidget {
  const TimerStreamWidget({super.key});

  Stream<int> _timerStream() async* {
    int i = 0;

    while (i < 100) {
      await Future.delayed(const Duration(seconds: 1));
      yield i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _timerStream(),
        builder: (context, snapshot) {
          final time = snapshot.data ?? 0;
          return Text(
            "Thời gian $time",
            style: TextStyle(fontSize: 24),
          );
        });
  }
}
