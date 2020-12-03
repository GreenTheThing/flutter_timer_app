part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

/// Triggers the [TimerRunInProgress] state.
class TimerStarted extends TimerEvent {
  // The current event's timer duration left.
  final int duration;

  const TimerStarted({@required this.duration});

  @override
  String toString() => "TimerStarted { duration: $duration }";
}

/// Trigger a new [TimerInitial] state with a new timer duration.
class TimerSet extends TimerEvent {
  // The current event's timer duration.
  final int duration;

  const TimerSet({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "TimerStarted { duration: $duration }";
}

/// Triggers the [TimerRunPause] state.
class TimerPaused extends TimerEvent {}

/// Triggers the [TimerRunInProgress] state.
class TimerResumed extends TimerEvent {}

/// Triggers the [TimerInitial] state.
class TimerReset extends TimerEvent {}

/// Triggers a new [TimerRunInProgress] state or the [TimerRunComplete] state
/// when the duration reaches 0.
class TimerTicked extends TimerEvent {
  // The current event's timer duration.
  final int duration;

  const TimerTicked({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "TimerTicked { duration: $duration }";
}
