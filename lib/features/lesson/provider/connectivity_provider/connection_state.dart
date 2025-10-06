import 'package:freezed_annotation/freezed_annotation.dart';
part 'connection_state.freezed.dart';

enum NetQuality { online, poor, offline }

/// Immutable state for connectivity status
/// - [status]: current network quality
/// - [lastLatencyMs]: last measured latency in milliseconds
/// Includes convenience getters [isOnline] and [isOffline]

@freezed
class ConnectionState with _$ConnectionState {
  const ConnectionState._();

  const factory ConnectionState({
    required NetQuality status,
    required double lastLatencyMs,
  }) = _ConnectionState;

  factory ConnectionState.initial() {
    return const ConnectionState(
      status: NetQuality.online,
      lastLatencyMs: 0,
    );
  }

  bool get isOnline => status == NetQuality.online;
  bool get isOffline => status == NetQuality.offline;
}
