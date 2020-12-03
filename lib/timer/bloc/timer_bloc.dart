import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_timer/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  // Stream of remaining ticks (duration left)
  final Ticker _ticker;

  int _initialDuration = 60;

  // Subscription to the ticker Stream
  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker,
        super(TimerInitial(60));

  /// Called whenever an [TimerEvent] is added and is responsible for
  /// converting that event into a new [TimerState].
  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is TimerStarted) {
      yield* _mapTimerStartedToState(event);
    } else if (event is TimerPaused) {
      yield* _mapTimerPausedToState(event);
    } else if (event is TimerResumed) {
      yield* _mapTimerResumedToState(event);
    } else if (event is TimerReset) {
      yield* _mapTimerResetToState(event);
    } else if (event is TimerTicked) {
      yield* _mapTimerTickedToState(event);
    } else if (event is TimerSet) {
      yield* _mapTimerSetToState(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription.cancel();
    return super.close();
  }

  /// Converts the [TimerSet] event to a [TimerInitial] state.
  Stream<TimerState> _mapTimerSetToState(TimerSet event) async* {
    yield TimerInitial(event.duration);

    // New initial duration
    _initialDuration = event.duration;
  }

  /// Converts the [TimerStarted] event to a [TimerRunInProgress] state.
  Stream<TimerState> _mapTimerStartedToState(TimerStarted event) async* {
    yield TimerRunInProgress(
      event.duration,
      _getTimerBackgroundLevel(event.duration),
    );

    // Subscribes to a new ticker with the event's duration
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  /// Converts the [TimerPaused] event to a [TimerRunPause] state if the
  /// current state is [TimerRunInProgress].
  Stream<TimerState> _mapTimerPausedToState(TimerPaused event) async* {
    if (state is TimerRunInProgress) {
      yield TimerRunPause(
        state.duration,
        _getTimerBackgroundLevel(state.duration),
      );

      // Pauses observing the Stream
      _tickerSubscription.pause();
    }
  }

  /// Converts the [TimerResumed] event to a [TimerRunInProgress] state if the
  /// current state is [TimerRunPause].
  Stream<TimerState> _mapTimerResumedToState(TimerResumed resume) async* {
    if (state is TimerRunPause) {
      yield TimerRunInProgress(
          state.duration, _getTimerBackgroundLevel(state.duration));

      // Resumes observing the Stream
      _tickerSubscription.resume();
    }
  }

  /// Converts the [TimerReset] event to a [TimerInitial] state.
  Stream<TimerState> _mapTimerResetToState(TimerReset reset) async* {
    yield TimerInitial(_initialDuration);

    // Cancels current subscription to the Ticker Stream
    _tickerSubscription.cancel();
  }

  /// Converts the [TimerTicked] event to a [TimerRunInProgress] state or a
  /// [TimerRunComplete] state.
  Stream<TimerState> _mapTimerTickedToState(TimerTicked tick) async* {
    yield tick.duration > 0
        ? TimerRunInProgress(
            tick.duration,
            _getTimerBackgroundLevel(tick.duration),
          )
        : TimerRunComplete();
  }

  /// Returns a value between 0 (0%) and 1 (100%) signifying the height
  /// of the background animation.
  double _getTimerBackgroundLevel(int duration) => duration / _initialDuration;
}
