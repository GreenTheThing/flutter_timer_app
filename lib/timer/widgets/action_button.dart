import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButton extends StatelessWidget {
  final TimerEvent event;
  final Icon icon;

  const ActionButton({
    @required this.icon,
    @required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      iconSize: 36.0,
      color: Colors.white,
      // Triggers corresponding state based on given event.
      onPressed: () => BlocProvider.of<TimerBloc>(context).add(event),
    );
  }
}
