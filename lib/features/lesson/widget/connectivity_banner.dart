import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/connectivity_provider/connectivity_provider.dart';

import '../provider/connectivity_provider/connection_state.dart';

class ConnectivityBanner extends ConsumerStatefulWidget {
  const ConnectivityBanner({super.key});

  @override
  ConsumerState<ConnectivityBanner> createState() => _ConnectivityBannerState();
}

class _ConnectivityBannerState extends ConsumerState<ConnectivityBanner> {
  //UI State is tracked here to allow dismissal of the banner
  //and to avoid re-showing it until the status changes again
  NetQuality? _lastStatus;
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    final network = ref.watch(connectivityProvider);

    if (network.status != _lastStatus) {
      _lastStatus = network.status;
      _dismissed = false;
    }
    // only show if not online and not dismissed
    if (network.isOnline || _dismissed) {
      return const SizedBox.shrink();
    }

    final isOffline = network.isOffline;
    final text = isOffline
        ? 'You are offline.'
        : 'Your connection is slow (${network.lastLatencyMs.toStringAsFixed(0)} ms)…';
    final color = isOffline ? Colors.red : Colors.orange;

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
