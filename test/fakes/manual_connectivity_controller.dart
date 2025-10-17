import 'package:sionnach_ui_community/features/lesson/presentation/controller/connectivity_controller.dart';
import 'package:sionnach_ui_community/features/lesson/presentation/state/connectivity_state.dart';

//A fake connectivity controller for testing purposes
// Use [emit] to set the current state
class ManualConnectivityController extends ConnectivityController {
  @override
  ConnectivityState build() => ConnectivityState.initial();

  void emit(NetQuality s, [double ms = 0]) {
    state = state.copyWith(status: s, lastLatencyMs: ms);
  }
}
