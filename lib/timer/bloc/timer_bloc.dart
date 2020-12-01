import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_timer/utils/utils.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  int initialDuration = 60;

  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker, int duration})
      : assert(ticker != null),

        _ticker = ticker,
        super(TimerInitial(60));

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
      initialDuration = event.duration;
      yield* _mapTimerSetToState(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription.cancel();
    return super.close();
  }

  Stream<TimerState> _mapTimerStartedToState(TimerStarted start) async* {
    yield TimerRunInProgress(start.duration, _getTimerPercentage(start.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: start.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  Stream<TimerState> _mapTimerPausedToState(TimerPaused pause) async* {
    if (state is TimerRunInProgress) {
      _tickerSubscription.pause();
      yield TimerRunPause(state.duration, _getTimerPercentage(state.duration));
    }
  }

  Stream<TimerState> _mapTimerResumedToState(TimerResumed resume) async* {
    if (state is TimerRunPause) {
      _tickerSubscription.resume();
      yield TimerRunInProgress(state.duration, _getTimerPercentage(state.duration));
    }
  }

  Stream<TimerState> _mapTimerResetToState(TimerReset reset) async* {
    _tickerSubscription.cancel();
    yield TimerInitial(initialDuration);
  }

  Stream<TimerState> _mapTimerTickedToState(TimerTicked tick) async* {
    yield tick.duration > 0
        ? TimerRunInProgress(tick.duration, _getTimerPercentage(tick.duration))
        : TimerRunComplete();
  }

  double _getTimerPercentage(int duration) => duration/initialDuration;

  Stream<TimerState> _mapTimerSetToState(TimerSet set) async* {
    yield TimerInitial(set.duration);
  }
}
