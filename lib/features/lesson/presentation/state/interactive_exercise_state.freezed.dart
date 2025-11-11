// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interactive_exercise_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InteractiveExerciseState {
  List<SentencePair> get sentences;
  int get currentSentenceIndex;
  int get currentWordIndex;
  String get currentUserInput;
  List<String> get revealedIrishWords;
  List<bool> get completedSentences;
  LessonState get lessonState;
  bool get isCurrentWordCorrect;
  bool get isWordRevealed;
  bool get isShiftEnabled;
  bool get isFadaEnabled;

  /// Create a copy of InteractiveExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InteractiveExerciseStateCopyWith<InteractiveExerciseState> get copyWith =>
      _$InteractiveExerciseStateCopyWithImpl<InteractiveExerciseState>(
          this as InteractiveExerciseState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InteractiveExerciseState &&
            const DeepCollectionEquality().equals(other.sentences, sentences) &&
            (identical(other.currentSentenceIndex, currentSentenceIndex) ||
                other.currentSentenceIndex == currentSentenceIndex) &&
            (identical(other.currentWordIndex, currentWordIndex) ||
                other.currentWordIndex == currentWordIndex) &&
            (identical(other.currentUserInput, currentUserInput) ||
                other.currentUserInput == currentUserInput) &&
            const DeepCollectionEquality()
                .equals(other.revealedIrishWords, revealedIrishWords) &&
            const DeepCollectionEquality()
                .equals(other.completedSentences, completedSentences) &&
            (identical(other.lessonState, lessonState) ||
                other.lessonState == lessonState) &&
            (identical(other.isCurrentWordCorrect, isCurrentWordCorrect) ||
                other.isCurrentWordCorrect == isCurrentWordCorrect) &&
            (identical(other.isWordRevealed, isWordRevealed) ||
                other.isWordRevealed == isWordRevealed) &&
            (identical(other.isShiftEnabled, isShiftEnabled) ||
                other.isShiftEnabled == isShiftEnabled) &&
            (identical(other.isFadaEnabled, isFadaEnabled) ||
                other.isFadaEnabled == isFadaEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sentences),
      currentSentenceIndex,
      currentWordIndex,
      currentUserInput,
      const DeepCollectionEquality().hash(revealedIrishWords),
      const DeepCollectionEquality().hash(completedSentences),
      lessonState,
      isCurrentWordCorrect,
      isWordRevealed,
      isShiftEnabled,
      isFadaEnabled);

  @override
  String toString() {
    return 'InteractiveExerciseState(sentences: $sentences, currentSentenceIndex: $currentSentenceIndex, currentWordIndex: $currentWordIndex, currentUserInput: $currentUserInput, revealedIrishWords: $revealedIrishWords, completedSentences: $completedSentences, lessonState: $lessonState, isCurrentWordCorrect: $isCurrentWordCorrect, isWordRevealed: $isWordRevealed, isShiftEnabled: $isShiftEnabled, isFadaEnabled: $isFadaEnabled)';
  }
}

/// @nodoc
abstract mixin class $InteractiveExerciseStateCopyWith<$Res> {
  factory $InteractiveExerciseStateCopyWith(InteractiveExerciseState value,
          $Res Function(InteractiveExerciseState) _then) =
      _$InteractiveExerciseStateCopyWithImpl;
  @useResult
  $Res call(
      {List<SentencePair> sentences,
      int currentSentenceIndex,
      int currentWordIndex,
      String currentUserInput,
      List<String> revealedIrishWords,
      List<bool> completedSentences,
      LessonState lessonState,
      bool isCurrentWordCorrect,
      bool isWordRevealed,
      bool isShiftEnabled,
      bool isFadaEnabled});
}

/// @nodoc
class _$InteractiveExerciseStateCopyWithImpl<$Res>
    implements $InteractiveExerciseStateCopyWith<$Res> {
  _$InteractiveExerciseStateCopyWithImpl(this._self, this._then);

  final InteractiveExerciseState _self;
  final $Res Function(InteractiveExerciseState) _then;

  /// Create a copy of InteractiveExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentences = null,
    Object? currentSentenceIndex = null,
    Object? currentWordIndex = null,
    Object? currentUserInput = null,
    Object? revealedIrishWords = null,
    Object? completedSentences = null,
    Object? lessonState = null,
    Object? isCurrentWordCorrect = null,
    Object? isWordRevealed = null,
    Object? isShiftEnabled = null,
    Object? isFadaEnabled = null,
  }) {
    return _then(_self.copyWith(
      sentences: null == sentences
          ? _self.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<SentencePair>,
      currentSentenceIndex: null == currentSentenceIndex
          ? _self.currentSentenceIndex
          : currentSentenceIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentWordIndex: null == currentWordIndex
          ? _self.currentWordIndex
          : currentWordIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentUserInput: null == currentUserInput
          ? _self.currentUserInput
          : currentUserInput // ignore: cast_nullable_to_non_nullable
              as String,
      revealedIrishWords: null == revealedIrishWords
          ? _self.revealedIrishWords
          : revealedIrishWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completedSentences: null == completedSentences
          ? _self.completedSentences
          : completedSentences // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lessonState: null == lessonState
          ? _self.lessonState
          : lessonState // ignore: cast_nullable_to_non_nullable
              as LessonState,
      isCurrentWordCorrect: null == isCurrentWordCorrect
          ? _self.isCurrentWordCorrect
          : isCurrentWordCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      isWordRevealed: null == isWordRevealed
          ? _self.isWordRevealed
          : isWordRevealed // ignore: cast_nullable_to_non_nullable
              as bool,
      isShiftEnabled: null == isShiftEnabled
          ? _self.isShiftEnabled
          : isShiftEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isFadaEnabled: null == isFadaEnabled
          ? _self.isFadaEnabled
          : isFadaEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [InteractiveExerciseState].
extension InteractiveExerciseStatePatterns on InteractiveExerciseState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InteractiveExerciseState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InteractiveExerciseState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InteractiveExerciseState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InteractiveExerciseState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InteractiveExerciseState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InteractiveExerciseState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<SentencePair> sentences,
            int currentSentenceIndex,
            int currentWordIndex,
            String currentUserInput,
            List<String> revealedIrishWords,
            List<bool> completedSentences,
            LessonState lessonState,
            bool isCurrentWordCorrect,
            bool isWordRevealed,
            bool isShiftEnabled,
            bool isFadaEnabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InteractiveExerciseState() when $default != null:
        return $default(
            _that.sentences,
            _that.currentSentenceIndex,
            _that.currentWordIndex,
            _that.currentUserInput,
            _that.revealedIrishWords,
            _that.completedSentences,
            _that.lessonState,
            _that.isCurrentWordCorrect,
            _that.isWordRevealed,
            _that.isShiftEnabled,
            _that.isFadaEnabled);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<SentencePair> sentences,
            int currentSentenceIndex,
            int currentWordIndex,
            String currentUserInput,
            List<String> revealedIrishWords,
            List<bool> completedSentences,
            LessonState lessonState,
            bool isCurrentWordCorrect,
            bool isWordRevealed,
            bool isShiftEnabled,
            bool isFadaEnabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InteractiveExerciseState():
        return $default(
            _that.sentences,
            _that.currentSentenceIndex,
            _that.currentWordIndex,
            _that.currentUserInput,
            _that.revealedIrishWords,
            _that.completedSentences,
            _that.lessonState,
            _that.isCurrentWordCorrect,
            _that.isWordRevealed,
            _that.isShiftEnabled,
            _that.isFadaEnabled);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<SentencePair> sentences,
            int currentSentenceIndex,
            int currentWordIndex,
            String currentUserInput,
            List<String> revealedIrishWords,
            List<bool> completedSentences,
            LessonState lessonState,
            bool isCurrentWordCorrect,
            bool isWordRevealed,
            bool isShiftEnabled,
            bool isFadaEnabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InteractiveExerciseState() when $default != null:
        return $default(
            _that.sentences,
            _that.currentSentenceIndex,
            _that.currentWordIndex,
            _that.currentUserInput,
            _that.revealedIrishWords,
            _that.completedSentences,
            _that.lessonState,
            _that.isCurrentWordCorrect,
            _that.isWordRevealed,
            _that.isShiftEnabled,
            _that.isFadaEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InteractiveExerciseState extends InteractiveExerciseState {
  const _InteractiveExerciseState(
      {required final List<SentencePair> sentences,
      required this.currentSentenceIndex,
      required this.currentWordIndex,
      required this.currentUserInput,
      required final List<String> revealedIrishWords,
      required final List<bool> completedSentences,
      required this.lessonState,
      required this.isCurrentWordCorrect,
      required this.isWordRevealed,
      required this.isShiftEnabled,
      required this.isFadaEnabled})
      : _sentences = sentences,
        _revealedIrishWords = revealedIrishWords,
        _completedSentences = completedSentences,
        super._();

  final List<SentencePair> _sentences;
  @override
  List<SentencePair> get sentences {
    if (_sentences is EqualUnmodifiableListView) return _sentences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentences);
  }

  @override
  final int currentSentenceIndex;
  @override
  final int currentWordIndex;
  @override
  final String currentUserInput;
  final List<String> _revealedIrishWords;
  @override
  List<String> get revealedIrishWords {
    if (_revealedIrishWords is EqualUnmodifiableListView)
      return _revealedIrishWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_revealedIrishWords);
  }

  final List<bool> _completedSentences;
  @override
  List<bool> get completedSentences {
    if (_completedSentences is EqualUnmodifiableListView)
      return _completedSentences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedSentences);
  }

  @override
  final LessonState lessonState;
  @override
  final bool isCurrentWordCorrect;
  @override
  final bool isWordRevealed;
  @override
  final bool isShiftEnabled;
  @override
  final bool isFadaEnabled;

  /// Create a copy of InteractiveExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InteractiveExerciseStateCopyWith<_InteractiveExerciseState> get copyWith =>
      __$InteractiveExerciseStateCopyWithImpl<_InteractiveExerciseState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InteractiveExerciseState &&
            const DeepCollectionEquality()
                .equals(other._sentences, _sentences) &&
            (identical(other.currentSentenceIndex, currentSentenceIndex) ||
                other.currentSentenceIndex == currentSentenceIndex) &&
            (identical(other.currentWordIndex, currentWordIndex) ||
                other.currentWordIndex == currentWordIndex) &&
            (identical(other.currentUserInput, currentUserInput) ||
                other.currentUserInput == currentUserInput) &&
            const DeepCollectionEquality()
                .equals(other._revealedIrishWords, _revealedIrishWords) &&
            const DeepCollectionEquality()
                .equals(other._completedSentences, _completedSentences) &&
            (identical(other.lessonState, lessonState) ||
                other.lessonState == lessonState) &&
            (identical(other.isCurrentWordCorrect, isCurrentWordCorrect) ||
                other.isCurrentWordCorrect == isCurrentWordCorrect) &&
            (identical(other.isWordRevealed, isWordRevealed) ||
                other.isWordRevealed == isWordRevealed) &&
            (identical(other.isShiftEnabled, isShiftEnabled) ||
                other.isShiftEnabled == isShiftEnabled) &&
            (identical(other.isFadaEnabled, isFadaEnabled) ||
                other.isFadaEnabled == isFadaEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sentences),
      currentSentenceIndex,
      currentWordIndex,
      currentUserInput,
      const DeepCollectionEquality().hash(_revealedIrishWords),
      const DeepCollectionEquality().hash(_completedSentences),
      lessonState,
      isCurrentWordCorrect,
      isWordRevealed,
      isShiftEnabled,
      isFadaEnabled);

  @override
  String toString() {
    return 'InteractiveExerciseState(sentences: $sentences, currentSentenceIndex: $currentSentenceIndex, currentWordIndex: $currentWordIndex, currentUserInput: $currentUserInput, revealedIrishWords: $revealedIrishWords, completedSentences: $completedSentences, lessonState: $lessonState, isCurrentWordCorrect: $isCurrentWordCorrect, isWordRevealed: $isWordRevealed, isShiftEnabled: $isShiftEnabled, isFadaEnabled: $isFadaEnabled)';
  }
}

/// @nodoc
abstract mixin class _$InteractiveExerciseStateCopyWith<$Res>
    implements $InteractiveExerciseStateCopyWith<$Res> {
  factory _$InteractiveExerciseStateCopyWith(_InteractiveExerciseState value,
          $Res Function(_InteractiveExerciseState) _then) =
      __$InteractiveExerciseStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<SentencePair> sentences,
      int currentSentenceIndex,
      int currentWordIndex,
      String currentUserInput,
      List<String> revealedIrishWords,
      List<bool> completedSentences,
      LessonState lessonState,
      bool isCurrentWordCorrect,
      bool isWordRevealed,
      bool isShiftEnabled,
      bool isFadaEnabled});
}

/// @nodoc
class __$InteractiveExerciseStateCopyWithImpl<$Res>
    implements _$InteractiveExerciseStateCopyWith<$Res> {
  __$InteractiveExerciseStateCopyWithImpl(this._self, this._then);

  final _InteractiveExerciseState _self;
  final $Res Function(_InteractiveExerciseState) _then;

  /// Create a copy of InteractiveExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sentences = null,
    Object? currentSentenceIndex = null,
    Object? currentWordIndex = null,
    Object? currentUserInput = null,
    Object? revealedIrishWords = null,
    Object? completedSentences = null,
    Object? lessonState = null,
    Object? isCurrentWordCorrect = null,
    Object? isWordRevealed = null,
    Object? isShiftEnabled = null,
    Object? isFadaEnabled = null,
  }) {
    return _then(_InteractiveExerciseState(
      sentences: null == sentences
          ? _self._sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<SentencePair>,
      currentSentenceIndex: null == currentSentenceIndex
          ? _self.currentSentenceIndex
          : currentSentenceIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentWordIndex: null == currentWordIndex
          ? _self.currentWordIndex
          : currentWordIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentUserInput: null == currentUserInput
          ? _self.currentUserInput
          : currentUserInput // ignore: cast_nullable_to_non_nullable
              as String,
      revealedIrishWords: null == revealedIrishWords
          ? _self._revealedIrishWords
          : revealedIrishWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completedSentences: null == completedSentences
          ? _self._completedSentences
          : completedSentences // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lessonState: null == lessonState
          ? _self.lessonState
          : lessonState // ignore: cast_nullable_to_non_nullable
              as LessonState,
      isCurrentWordCorrect: null == isCurrentWordCorrect
          ? _self.isCurrentWordCorrect
          : isCurrentWordCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      isWordRevealed: null == isWordRevealed
          ? _self.isWordRevealed
          : isWordRevealed // ignore: cast_nullable_to_non_nullable
              as bool,
      isShiftEnabled: null == isShiftEnabled
          ? _self.isShiftEnabled
          : isShiftEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isFadaEnabled: null == isFadaEnabled
          ? _self.isFadaEnabled
          : isFadaEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
