import 'package:sionnach_ui_community/features/lesson/provider/connectivity_provider/connectivity_provider.dart';
import 'package:sionnach_ui_community/features/lesson/provider/connectivity_provider/connectivity_state.dart';

/// A fake connectivity notifier for testing purposes
/// Use [emit] to change the state

class ManualConnectivityNotifier extends ConnectivityNotifier {
  ManualConnectivityNotifier() : super();
  @override
  ConnectivityState build() =>
      const ConnectivityState(status: NetQuality.online, lastLatencyMs: 0);
  void emit(NetQuality s, [double ms = 0]) =>
      state = ConnectivityState(status: s, lastLatencyMs: ms);
}
