// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConnectivityRepo)
const connectivityRepoProvider = ConnectivityRepoProvider._();

final class ConnectivityRepoProvider
    extends $NotifierProvider<ConnectivityRepo, BaseConnectivityRepository> {
  const ConnectivityRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'connectivityRepoProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$connectivityRepoHash();

  @$internal
  @override
  ConnectivityRepo create() => ConnectivityRepo();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseConnectivityRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseConnectivityRepository>(value),
    );
  }
}

String _$connectivityRepoHash() => r'434420ae00703c775fd840c48cb956273ae4704f';

abstract class _$ConnectivityRepo
    extends $Notifier<BaseConnectivityRepository> {
  BaseConnectivityRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<BaseConnectivityRepository, BaseConnectivityRepository>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<BaseConnectivityRepository, BaseConnectivityRepository>,
        BaseConnectivityRepository,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
