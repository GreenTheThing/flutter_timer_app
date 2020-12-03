import 'dart:io';

import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetTimerButton extends StatelessWidget {
  final int value;

  SetTimerButton({@required this.value});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
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
              ? CupertinoTimerDialog(value: value)
              : MaterialTimerDialog(value: value),
        );
        if (time != null) {
          BlocProvider.of<TimerBloc>(context).add(TimerSet(duration: time));
        }
      },
      child: Text(
        'Set timer',
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
      ),
    );
  }
}
