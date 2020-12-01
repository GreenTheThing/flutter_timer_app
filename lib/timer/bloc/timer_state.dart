part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int duration;
  final double level;

  const TimerState(this.duration, this.level);

  @override
  List<Object> get props {
    return [duration];
  }
}

class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration, 1);

  @override
  String toString() {
    return "TimerInitial { duration: $duration }";
  }
}

class TimerRunPause extends TimerState {
  const TimerRunPause(int duration, double level) : super(duration, level);

  @override
  String toString() {
    return "TimerRunPause { duration: $duration, level: $level }";
  }
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int duration, double level) : super(duration, level);

  @override
  String toString() {
    return "TimerRunInProgress { duration: $duration, level: $level }";
  }
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0, 0);
}
