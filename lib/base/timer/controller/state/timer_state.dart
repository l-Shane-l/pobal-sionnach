import 'package:freezed_annotation/freezed_annotation.dart';
part 'timer_state.freezed.dart';

@freezed
abstract class Lap with _$Lap {
  const Lap._();
  const factory Lap(
      {required String id,
      required String label,
      required int startMs,
      int? endMs,
      @Default(0) int extras}) = _Lap;

  int get durationMs => (endMs ?? startMs) - startMs;
  bool get isOpen => endMs == null;

  Lap closeAt(int endMs) =>
      Lap(id: id, label: label, startMs: startMs, endMs: endMs, extras: extras);
}

@freezed
abstract class TimerState with _$TimerState {
  const TimerState._();
  const factory TimerState({
    required bool running,
    required int startedEpochMs,
    required int elapsedMs,
    required List<Lap> laps,
  }) = _TimerState;

  factory TimerState.initial() => const TimerState(
      running: false, startedEpochMs: 0, elapsedMs: 0, laps: []);
}
