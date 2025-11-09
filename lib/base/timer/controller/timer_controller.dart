// lib/feature/timer/exercise_timer_controller.dart
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'state/timer_state.dart';
import '../provider/timer_clock.dart';

part 'timer_controller.g.dart';

@Riverpod(keepAlive: true)
class TimerController extends _$TimerController {
  Stopwatch? _sw;
  Timer? _ticker; // periodic UI updates

  IClock get _clock => ref.read(clockProvider);

  @override
  TimerState build() {
    ref.onDispose(() {
      _ticker?.cancel();
    });
    return TimerState.initial();
  }

  void startExercise() {
    if (state.running) return;
    _sw = _clock.newStopwatch()..start();
    final started = _clock.nowMs();
    state = TimerState(
      running: true,
      startedEpochMs: started,
      elapsedMs: 0,
      laps: const [],
    );

    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      if (!state.running || _sw == null) return;
      state = state.copyWith(elapsedMs: _sw!.elapsedMilliseconds);
    });
  }

  void stopExercise() {
    if (!state.running) return;
    _ticker?.cancel();
    _sw?.stop();
    final total = _sw?.elapsedMilliseconds ?? state.elapsedMs;

    // Close any open lap at stop time
    final nowSinceStart = total; // elapsed = ms since start
    final closed =
        state.laps.map((l) => l.isOpen ? l.closeAt(nowSinceStart) : l).toList();

    state = state.copyWith(running: false, elapsedMs: total, laps: closed);
  }

  /// Begin a new lap; closes any open lap first.
  void startLap({required String id, required String label}) {
    if (!state.running || _sw == null) return;
    final sinceStart = _sw!.elapsedMilliseconds;

    // Close previous open lap if any
    final current = [...state.laps];
    if (current.isNotEmpty && current.last.isOpen) {
      current[current.length - 1] = current.last.closeAt(sinceStart);
    }
    current.add(Lap(id: id, label: label, startMs: sinceStart));
    state = state.copyWith(laps: current, elapsedMs: sinceStart);
  }

  /// Ends the current lap (if any is open).
  void endLap() {
    if (!state.running || _sw == null) return;
    final sinceStart = _sw!.elapsedMilliseconds;
    final current = [...state.laps];
    if (current.isNotEmpty && current.last.isOpen) {
      current[current.length - 1] = current.last.closeAt(sinceStart);
      state = state.copyWith(laps: current, elapsedMs: sinceStart);
    }
  }

  void lapToNext({required String nextId, required String nextLabel}) {
    endLap();
    startLap(id: nextId, label: nextLabel);
  }

  void lapAddExtra() {
    final current = [...state.laps];

    if (current.isNotEmpty && current.last.isOpen) {
      current.last = current.last.copyWith(extras: current.last.extras + 1);
      state = state.copyWith(laps: current);
    }
  }

  /// Reset everything
  void reset() {
    _ticker?.cancel();
    _sw?.stop();
    _sw = null;
    state = TimerState.initial();
  }
}
