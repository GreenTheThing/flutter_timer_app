import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimerDialog extends StatelessWidget {
  // Initial value displayed on the spinner.
  final int value;

  const CupertinoTimerDialog({
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    int time = value;
    return CupertinoAlertDialog(
      title: Text('Set timer value'),
      content: CupertinoTimerPicker(
        // spinner has [min. | sec.] format.
        mode: CupertinoTimerPickerMode.ms,
        minuteInterval: 1,
        secondInterval: 1,
        initialTimerDuration: Duration(
          seconds: time,
        ),
        // Set new timer value
        onTimerDurationChanged: (duration) => time = duration.inSeconds,
      ),
      actions: [
        CupertinoButton(
          child: Text('Set'),
          // Returns new timer value.
          onPressed: () => Navigator.of(context).pop(time),
        ),
        CupertinoButton(
          child: Text('Cancel', style: TextStyle(color: Colors.red)),
          // Returns null.
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
