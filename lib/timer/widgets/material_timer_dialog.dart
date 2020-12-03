import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/scroll_picker.dart';

class MaterialTimerDialog extends StatelessWidget {
  // Initial value of the timer.
  final int value;

  MaterialTimerDialog({
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // Initial timer minutes.
    int minutes = value ~/ 60;
    // Initial timer seconds.
    int seconds = value % 60;

    // List of values displayed in the spinners from 0 to 59.
    final items = List<String>.generate(60, (index) => index.toString());

    return AlertDialog(
      title: Text('Set timer value'),
      titleTextStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0),
      // Row of spinners to match the [CupertinoTimerPicker].
      content: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Minutes spinner.
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.36,
            width: MediaQuery.of(context).size.width * 0.24,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: ScrollPicker(
                items: items,
                initialValue: items[minutes],
                // Sets the the value to selected index.
                onChanged: (value) => minutes = items.indexOf(value),
              ),
            ),
          ),
          Text(
            'min.',
            style: TextStyle(color: Colors.black),
          ),
          // Seconds spinner.
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.36,
            width: MediaQuery.of(context).size.width * 0.24,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: ScrollPicker(
                items: items,
                initialValue: items[seconds],
                // Sets the the value to selected index.
                onChanged: (value) => seconds = items.indexOf(value),
              ),
            ),
          ),
          Text(
            'sec.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: Text('Cancel'),
          // Returns null.
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text('Set'),
          // Returns new timer value.
          onPressed: () => Navigator.of(context).pop(minutes * 60 + seconds),
        )
      ],
    );
  }
}
