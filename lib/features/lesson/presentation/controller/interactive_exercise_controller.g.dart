// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interactive_exercise_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$interactiveExerciseControllerHash() =>
    r'b92584531c9a98293445f8f02093488476b461d3';

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

abstract class _$InteractiveExerciseController
    extends BuildlessAutoDisposeNotifier<InteractiveExerciseState> {
  late final List<SentencePair> sentences;

  InteractiveExerciseState build(
    List<SentencePair> sentences,
  );
}

/// See also [InteractiveExerciseController].
@ProviderFor(InteractiveExerciseController)
const interactiveExerciseControllerProvider =
    InteractiveExerciseControllerFamily();

/// See also [InteractiveExerciseController].
class InteractiveExerciseControllerFamily
    extends Family<InteractiveExerciseState> {
  /// See also [InteractiveExerciseController].
  const InteractiveExerciseControllerFamily();

  /// See also [InteractiveExerciseController].
  InteractiveExerciseControllerProvider call(
    List<SentencePair> sentences,
  ) {
    return InteractiveExerciseControllerProvider(
      sentences,
    );
  }

  @override
  InteractiveExerciseControllerProvider getProviderOverride(
    covariant InteractiveExerciseControllerProvider provider,
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
  String? get name => r'interactiveExerciseControllerProvider';
}

/// See also [InteractiveExerciseController].
class InteractiveExerciseControllerProvider
    extends AutoDisposeNotifierProviderImpl<InteractiveExerciseController,
        InteractiveExerciseState> {
  /// See also [InteractiveExerciseController].
  InteractiveExerciseControllerProvider(
    List<SentencePair> sentences,
  ) : this._internal(
          () => InteractiveExerciseController()..sentences = sentences,
          from: interactiveExerciseControllerProvider,
          name: r'interactiveExerciseControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$interactiveExerciseControllerHash,
          dependencies: InteractiveExerciseControllerFamily._dependencies,
          allTransitiveDependencies:
              InteractiveExerciseControllerFamily._allTransitiveDependencies,
          sentences: sentences,
        );

  InteractiveExerciseControllerProvider._internal(
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
  InteractiveExerciseState runNotifierBuild(
    covariant InteractiveExerciseController notifier,
  ) {
    return notifier.build(
      sentences,
    );
  }

  @override
  Override overrideWith(InteractiveExerciseController Function() create) {
    return ProviderOverride(
      origin: this,
      override: InteractiveExerciseControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<InteractiveExerciseController,
      InteractiveExerciseState> createElement() {
    return _InteractiveExerciseControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InteractiveExerciseControllerProvider &&
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
mixin InteractiveExerciseControllerRef
    on AutoDisposeNotifierProviderRef<InteractiveExerciseState> {
  /// The parameter `sentences` of this provider.
  List<SentencePair> get sentences;
}

class _InteractiveExerciseControllerProviderElement
    extends AutoDisposeNotifierProviderElement<InteractiveExerciseController,
        InteractiveExerciseState> with InteractiveExerciseControllerRef {
  _InteractiveExerciseControllerProviderElement(super.provider);

  @override
  List<SentencePair> get sentences =>
      (origin as InteractiveExerciseControllerProvider).sentences;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
