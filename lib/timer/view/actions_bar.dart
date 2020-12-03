import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      // Rebuilds widget only when the state changes.
      buildWhen: (previousState, currentState) => currentState != previousState,
      builder: (context, state) => ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: _mapStateToMaterialActionButtons(state),
      ),
    );
  }

  // Exposes appropriate action buttons based on current state.
  List<Widget> _mapStateToMaterialActionButtons(TimerState state) {
    if (state is TimerInitial) {
      return [
        ActionButton(
          icon: Icon(Icons.play_arrow),
          event: TimerStarted(duration: state.duration),
        ),
        SetTimerButton(value: state.duration)
      ];
    } else if (state is TimerRunInProgress) {
      return [
        ActionButton(
          icon: Icon(Icons.pause),
          event: TimerPaused(),
        ),
        ActionButton(
          icon: Icon(Icons.replay),
          event: TimerReset(),
        ),
      ];
    } else if (state is TimerRunPause) {
      return [
        ActionButton(
          icon: Icon(Icons.play_arrow),
          event: TimerResumed(),
        ),
        ActionButton(
          icon: Icon(Icons.replay),
          event: TimerReset(),
        ),
      ];
    } else if (state is TimerRunComplete) {
      return [
        ActionButton(
          icon: Icon(Icons.replay),
          event: TimerReset(),
        ),
      ];
    } else {
      return [];
    }
  }
}
