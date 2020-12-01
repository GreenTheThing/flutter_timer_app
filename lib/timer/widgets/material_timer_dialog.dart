import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/scroll_picker.dart';

class MaterialTimerDialog extends StatelessWidget {
  final int value;

  MaterialTimerDialog({@required this.value});

  @override
  Widget build(BuildContext context) {
    int minutes = (value / 60).floor() ?? 1;
    int seconds = value % 60 ?? 0;

    final items = List<String>.generate(60, (index) => index.toString());

    return AlertDialog(
      title: Text('Set timer value'),
      titleTextStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0),
      content: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.36,
            width: MediaQuery.of(context).size.width * 0.24,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: ScrollPicker(
                items: items,
                initialValue: items[minutes],
                onChanged: (value) => minutes = items.indexOf(value),
              ),
            ),
          ),
          Text(
            'min.',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.36,
            width: MediaQuery.of(context).size.width * 0.24,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: ScrollPicker(
                items: items,
                initialValue: items[seconds],
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text('Set'),
          onPressed: () => Navigator.of(context).pop(minutes * 60 + seconds),
        )
      ],
    );
  }
}
