// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interactive_exercise_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InteractiveExerciseController)
const interactiveExerciseControllerProvider =
    InteractiveExerciseControllerFamily._();

final class InteractiveExerciseControllerProvider extends $NotifierProvider<
    InteractiveExerciseController, InteractiveExerciseState> {
  const InteractiveExerciseControllerProvider._(
      {required InteractiveExerciseControllerFamily super.from,
      required List<SentencePair> super.argument})
      : super(
          retry: null,
          name: r'interactiveExerciseControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$interactiveExerciseControllerHash();

  @override
  String toString() {
    return r'interactiveExerciseControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  InteractiveExerciseController create() => InteractiveExerciseController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InteractiveExerciseState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InteractiveExerciseState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InteractiveExerciseControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$interactiveExerciseControllerHash() =>
    r'b92584531c9a98293445f8f02093488476b461d3';

final class InteractiveExerciseControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            InteractiveExerciseController,
            InteractiveExerciseState,
            InteractiveExerciseState,
            InteractiveExerciseState,
            List<SentencePair>> {
  const InteractiveExerciseControllerFamily._()
      : super(
          retry: null,
          name: r'interactiveExerciseControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  InteractiveExerciseControllerProvider call(
    List<SentencePair> sentences,
  ) =>
      InteractiveExerciseControllerProvider._(argument: sentences, from: this);

  @override
  String toString() => r'interactiveExerciseControllerProvider';
}

abstract class _$InteractiveExerciseController
    extends $Notifier<InteractiveExerciseState> {
  late final _$args = ref.$arg as List<SentencePair>;
  List<SentencePair> get sentences => _$args;

  InteractiveExerciseState build(
    List<SentencePair> sentences,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref =
        this.ref as $Ref<InteractiveExerciseState, InteractiveExerciseState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<InteractiveExerciseState, InteractiveExerciseState>,
        InteractiveExerciseState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
