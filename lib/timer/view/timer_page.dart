import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Background(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Time(),
            SizedBox(height: 32.0),
            ActionsWidget(),
          ],
        ),
      ]),
    );
  }
}
