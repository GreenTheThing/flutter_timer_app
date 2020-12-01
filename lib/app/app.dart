import 'package:bloc_timer/timer/timer.dart';
import 'package:bloc_timer/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        accentColor: Colors.blue[800],
        brightness: Brightness.dark,
      ),
      title: 'Flutter Timer',
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: TimerPage(),
      ),
    );
  }
}
