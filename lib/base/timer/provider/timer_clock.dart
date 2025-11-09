import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'timer_clock.g.dart';

abstract class IClock {
  int nowMs(); // epoch ms
  Stopwatch newStopwatch();
}

class SystemClock implements IClock {
  @override
  int nowMs() => DateTime.now().millisecondsSinceEpoch;
  @override
  Stopwatch newStopwatch() => Stopwatch();
}

@riverpod
IClock clock(ClockRef ref) => SystemClock();
