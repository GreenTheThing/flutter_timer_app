import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimerDialog extends StatelessWidget {
  final int value;

  CupertinoTimerDialog({@required this.value});

  @override
  Widget build(BuildContext context) {
    int time = value ?? 60;
    return CupertinoAlertDialog(
      title: Text('Set timer value'),
      content: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.ms,
        minuteInterval: 1,
        secondInterval: 1,
        initialTimerDuration: Duration(
          seconds: time,
        ),
        onTimerDurationChanged: (duration) => time = duration.inSeconds,
      ),
      actions: [
        CupertinoButton(
          child: Text('Set'),
          onPressed: () => Navigator.of(context).pop(time),
        ),
        CupertinoButton(
          child: Text('Cancel', style: TextStyle(color: Colors.red)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
