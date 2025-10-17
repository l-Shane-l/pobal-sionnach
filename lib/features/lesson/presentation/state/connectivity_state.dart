import 'package:freezed_annotation/freezed_annotation.dart';
part 'connectivity_state.freezed.dart';

enum NetQuality { online, poor, offline, invalid }

/// Immutable state for connectivity status
/// - [status]: current network quality
/// - [lastLatencyMs]: last measured latency in milliseconds
/// Includes convenience getters [isOnline] [isOffline] and [valid]

@freezed
class ConnectivityState with _$ConnectivityState {
  const ConnectivityState._();

  const factory ConnectivityState({
    required NetQuality status,
    required double lastLatencyMs,
  }) = _ConnectivityState;

  factory ConnectivityState.initial() {
    return const ConnectivityState(
      status: NetQuality.online,
      lastLatencyMs: 0,
    );
  }

  bool get isOnline => status == NetQuality.online;
  bool get isOffline => status == NetQuality.offline;
  bool get valid => status != NetQuality.invalid;
}
