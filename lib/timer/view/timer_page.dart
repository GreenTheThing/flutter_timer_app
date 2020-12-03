import 'package:bloc_timer/timer/timer.dart';
import 'package:bloc_timer/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provides an instance of [TimerBloc] to be used by the widget tree.
    return BlocProvider(
      create: (context) => TimerBloc(ticker: Ticker()),
      // Screen UI structure.
      child: Scaffold(
        body: Stack(
          children: [
            Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TimerView(),
                SizedBox(height: 32.0),
                ActionsBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
