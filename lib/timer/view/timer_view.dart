import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<TimerBloc, TimerState>(
        // Rebuilds widget on each tick.
        buildWhen: (previousState, currentState) =>
            previousState.duration != currentState.duration,
        builder: (context, state) {
          // Gets current minutes left as String.
          final String minutes = (state.duration ~/ 60)
              .toString()
              // Converts single digit numbers to double digit.
              .padLeft(2, '0');
          // Gets current seconds left as String.
          final String seconds = (state.duration % 60)
              .toString()
              // Converts single digit numbers to double digit.
              .padLeft(2, '0');
          return Text(
            '$minutes:$seconds',
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 64.0,
            ),
          );
        },
      ),
    );
  }
}
