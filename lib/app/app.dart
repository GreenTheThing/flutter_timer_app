import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Used as the root widget of the app tree.
class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Specifies the style to use for the system overlays that are visible.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Sets Android status bar color to transparent to match iOS platform.
      statusBarColor: Colors.transparent,

      // Sets iOS status bar components to dark mode (white overlay)
      // to match Android platform.
      statusBarBrightness: Brightness.dark,
    ));

    // Specifies the set of orientations the application interface can
    // be displayed in.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      // Hides the debug banner from the top right corner of the app.
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        accentColor: Colors.blue[800],

        // Sets the theme to dark mode.
        brightness: Brightness.dark,
      ),

      // Shows up only on Android in the task manager.
      title: 'TimerApp',

      // App's home screen.
      home: TimerPage(),
    );
  }
}
