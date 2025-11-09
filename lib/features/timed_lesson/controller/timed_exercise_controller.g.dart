// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timed_exercise_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timedExerciseControllerHash() =>
    r'0d6b6c2eaba353e0c2fd042918936ba741a44487';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TimedExerciseController
    extends BuildlessAutoDisposeNotifier<TimedExerciseState> {
  late final List<SentencePair> sentences;

  TimedExerciseState build(
    List<SentencePair> sentences,
  );
}

/// See also [TimedExerciseController].
@ProviderFor(TimedExerciseController)
const timedExerciseControllerProvider = TimedExerciseControllerFamily();

/// See also [TimedExerciseController].
class TimedExerciseControllerFamily extends Family<TimedExerciseState> {
  /// See also [TimedExerciseController].
  const TimedExerciseControllerFamily();

  /// See also [TimedExerciseController].
  TimedExerciseControllerProvider call(
    List<SentencePair> sentences,
  ) {
    return TimedExerciseControllerProvider(
      sentences,
    );
  }

  @override
  TimedExerciseControllerProvider getProviderOverride(
    covariant TimedExerciseControllerProvider provider,
  ) {
    return call(
      provider.sentences,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'timedExerciseControllerProvider';
}

/// See also [TimedExerciseController].
class TimedExerciseControllerProvider extends AutoDisposeNotifierProviderImpl<
    TimedExerciseController, TimedExerciseState> {
  /// See also [TimedExerciseController].
  TimedExerciseControllerProvider(
    List<SentencePair> sentences,
  ) : this._internal(
          () => TimedExerciseController()..sentences = sentences,
          from: timedExerciseControllerProvider,
          name: r'timedExerciseControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$timedExerciseControllerHash,
          dependencies: TimedExerciseControllerFamily._dependencies,
          allTransitiveDependencies:
              TimedExerciseControllerFamily._allTransitiveDependencies,
          sentences: sentences,
        );

  TimedExerciseControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sentences,
  }) : super.internal();

  final List<SentencePair> sentences;

  @override
  TimedExerciseState runNotifierBuild(
    covariant TimedExerciseController notifier,
  ) {
    return notifier.build(
      sentences,
    );
  }

  @override
  Override overrideWith(TimedExerciseController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TimedExerciseControllerProvider._internal(
        () => create()..sentences = sentences,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sentences: sentences,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TimedExerciseController,
      TimedExerciseState> createElement() {
    return _TimedExerciseControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TimedExerciseControllerProvider &&
        other.sentences == sentences;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sentences.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TimedExerciseControllerRef
    on AutoDisposeNotifierProviderRef<TimedExerciseState> {
  /// The parameter `sentences` of this provider.
  List<SentencePair> get sentences;
}

class _TimedExerciseControllerProviderElement
    extends AutoDisposeNotifierProviderElement<TimedExerciseController,
        TimedExerciseState> with TimedExerciseControllerRef {
  _TimedExerciseControllerProviderElement(super.provider);

  @override
  List<SentencePair> get sentences =>
      (origin as TimedExerciseControllerProvider).sentences;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
