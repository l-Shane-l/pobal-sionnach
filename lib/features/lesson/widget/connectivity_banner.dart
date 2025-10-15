import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../presentation/controller/connectivity_controller.dart';
import '../provider/connectivity_provider/connectivity_state.dart';

class ConnectivityBanner extends ConsumerStatefulWidget {
  const ConnectivityBanner({super.key});

  @override
  ConsumerState<ConnectivityBanner> createState() => _ConnectivityBannerState();
}

class _ConnectivityBannerState extends ConsumerState<ConnectivityBanner> {
  //UI State is tracked here to allow dismissal of the banner
  //and to avoid re-showing it until the status changes again
  //without maintaining UI state in the Controller
  NetQuality? _lastStatus;
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    final network = ref.watch(connectivityControllerProvider);

    // reset dismissed if status changed
    if (network.status != _lastStatus) {
      _lastStatus = network.status;
      _dismissed = false;
    }
    // only show if not online and not dismissed
    // else return nothing
    if (network.isOnline || _dismissed) {
      return const SizedBox.shrink();
    }

    final isOffline = network.isOffline;
    final isValid = network.valid;

    final (text, color) = switch ((isOffline, isValid)) {
      (true, _) => ('You are offline.', Colors.red),
      (false, false) => ('Connection check unavailable.', Colors.grey),
      (false, true) => (
          'Your connection is slow (${network.lastLatencyMs.toStringAsFixed(0)} ms)…',
          Colors.orange
        )
    };

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: color.withValues(alpha: 0.1),
      child: Row(
        children: [
          Icon(isOffline ? Icons.cloud_off : Icons.network_check, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: TextStyle(color: color)),
          ),
          TextButton(
            onPressed: () {
              // Dismiss the banner until status changes again
              setState(() {
                _dismissed = true;
              });
            },
            child: const Text('Dismiss'),
          ),
        ],
      ),
    );
  }
}
