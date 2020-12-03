part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  // Timer duration at the moment the state is triggered.
  final int duration;

  // Determines the background height based on based on the remaining duration.
  final double level;

  const TimerState(this.duration, this.level);

  @override
  List<Object> get props => [duration, level];
}

/// Initial state of the timer.
class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration, 1);

  @override
  String toString() {
    return "TimerInitial { duration: $duration }";
  }
}

/// State of the timer while ticker is running.
class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int duration, double level) : super(duration, level);

  @override
  String toString() {
    return "TimerRunInProgress { duration: $duration, level: $level }";
  }
}

/// State if the timer while ticker is paused.
class TimerRunPause extends TimerState {
  const TimerRunPause(int duration, double level) : super(duration, level);

  @override
  String toString() {
    return "TimerRunPause { duration: $duration, level: $level }";
  }
}

/// State of the timer when ticker reaches 0.
class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0, 0);
}
