import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Time extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<TimerBloc, TimerState>(
        buildWhen: (previousState, currentState) =>
            previousState.duration != currentState.duration,
        builder: (context, state) {
          final String minutes =
              ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
          final String seconds =
              (state.duration % 60).floor().toString().padLeft(2, '0');
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
