// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConnectivityController)
const connectivityControllerProvider = ConnectivityControllerProvider._();

final class ConnectivityControllerProvider
    extends $NotifierProvider<ConnectivityController, ConnectivityState> {
  const ConnectivityControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'connectivityControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$connectivityControllerHash();

  @$internal
  @override
  ConnectivityController create() => ConnectivityController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityState>(value),
    );
  }
}

String _$connectivityControllerHash() =>
    r'8b657ab12416b0e43365e3a875b73d99c6cc4a68';

abstract class _$ConnectivityController extends $Notifier<ConnectivityState> {
  ConnectivityState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ConnectivityState, ConnectivityState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ConnectivityState, ConnectivityState>,
        ConnectivityState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
