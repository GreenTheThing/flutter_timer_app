import 'dart:io';

import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previousState, currentState) => currentState != previousState,
      builder: (context, state) => ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: _mapStateToMaterialActionButtons(context, state),
      ),
    );
  }

  List<Widget> _mapStateToMaterialActionButtons(
    BuildContext context,
    TimerState state,
  ) {
    if (state is TimerInitial) {
      return [
        IconButton(
          icon: Icon(Icons.play_arrow),
          iconSize: 36.0,
          color: Colors.white,
          onPressed: () => context
              .read<TimerBloc>()
              .add(TimerStarted(duration: state.duration)),
        ),
        FlatButton(
          color: Theme.of(context).buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(12.0),
          onPressed: () async {
            final time = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Platform.isIOS
                  ? CupertinoTimerDialog(value: state.duration)
                  : MaterialTimerDialog(value: state.duration),
            );
            if (time != null) {
              context.read<TimerBloc>().add(TimerSet(duration: time));
            }
          },
          child: Text(
            'Set timer',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
          ),
        ),
      ];
    } else if (state is TimerRunInProgress) {
      return [
        IconButton(
          icon: Icon(Icons.pause),
          iconSize: 36.0,
          color: Colors.white,
          onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
        ),
        IconButton(
          icon: Icon(Icons.replay),
          iconSize: 36.0,
          color: Colors.white,
          onPressed: () => context.read<TimerBloc>().add(TimerReset()),
        ),
      ];
    } else if (state is TimerRunPause) {
      return [
        IconButton(
          icon: Icon(Icons.play_arrow),
          iconSize: 36.0,
          color: Colors.white,
          onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
        ),
        IconButton(
          icon: Icon(Icons.replay),
          onPressed: () => context.read<TimerBloc>().add(TimerReset()),
        ),
      ];
    } else if (state is TimerRunComplete) {
      return [
        IconButton(
          icon: Icon(Icons.replay),
          iconSize: 36.0,
          color: Colors.white,
          onPressed: () => context.read<TimerBloc>().add(TimerReset()),
        ),
      ];
    } else
      return [];
  }
}
