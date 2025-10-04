// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interactive_exercise_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InteractiveExerciseState {
  List<SentencePair> get sentences => throw _privateConstructorUsedError;
  int get currentSentenceIndex => throw _privateConstructorUsedError;
  int get currentWordIndex => throw _privateConstructorUsedError;
  String get currentUserInput => throw _privateConstructorUsedError;
  List<String> get revealedIrishWords => throw _privateConstructorUsedError;
  List<bool> get completedSentences => throw _privateConstructorUsedError;
  LessonState get lessonState => throw _privateConstructorUsedError;
  bool get isCurrentWordCorrect => throw _privateConstructorUsedError;
  bool get isWordRevealed => throw _privateConstructorUsedError;
  bool get isShiftEnabled => throw _privateConstructorUsedError;
  bool get isFadaEnabled => throw _privateConstructorUsedError;

  /// Create a copy of InteractiveExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InteractiveExerciseStateCopyWith<InteractiveExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteractiveExerciseStateCopyWith<$Res> {
  factory $InteractiveExerciseStateCopyWith(InteractiveExerciseState value,
          $Res Function(InteractiveExerciseState) then) =
      _$InteractiveExerciseStateCopyWithImpl<$Res, InteractiveExerciseState>;
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
class _$InteractiveExerciseStateCopyWithImpl<$Res,
        $Val extends InteractiveExerciseState>
    implements $InteractiveExerciseStateCopyWith<$Res> {
  _$InteractiveExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      sentences: null == sentences
          ? _value.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<SentencePair>,
      currentSentenceIndex: null == currentSentenceIndex
          ? _value.currentSentenceIndex
          : currentSentenceIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentWordIndex: null == currentWordIndex
          ? _value.currentWordIndex
          : currentWordIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentUserInput: null == currentUserInput
          ? _value.currentUserInput
          : currentUserInput // ignore: cast_nullable_to_non_nullable
              as String,
      revealedIrishWords: null == revealedIrishWords
          ? _value.revealedIrishWords
          : revealedIrishWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completedSentences: null == completedSentences
          ? _value.completedSentences
          : completedSentences // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lessonState: null == lessonState
          ? _value.lessonState
          : lessonState // ignore: cast_nullable_to_non_nullable
              as LessonState,
      isCurrentWordCorrect: null == isCurrentWordCorrect
          ? _value.isCurrentWordCorrect
          : isCurrentWordCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      isWordRevealed: null == isWordRevealed
          ? _value.isWordRevealed
          : isWordRevealed // ignore: cast_nullable_to_non_nullable
              as bool,
      isShiftEnabled: null == isShiftEnabled
          ? _value.isShiftEnabled
          : isShiftEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isFadaEnabled: null == isFadaEnabled
          ? _value.isFadaEnabled
          : isFadaEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InteractiveExerciseStateImplCopyWith<$Res>
    implements $InteractiveExerciseStateCopyWith<$Res> {
  factory _$$InteractiveExerciseStateImplCopyWith(
          _$InteractiveExerciseStateImpl value,
          $Res Function(_$InteractiveExerciseStateImpl) then) =
      __$$InteractiveExerciseStateImplCopyWithImpl<$Res>;
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
class __$$InteractiveExerciseStateImplCopyWithImpl<$Res>
    extends _$InteractiveExerciseStateCopyWithImpl<$Res,
        _$InteractiveExerciseStateImpl>
    implements _$$InteractiveExerciseStateImplCopyWith<$Res> {
  __$$InteractiveExerciseStateImplCopyWithImpl(
      _$InteractiveExerciseStateImpl _value,
      $Res Function(_$InteractiveExerciseStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$InteractiveExerciseStateImpl(
      sentences: null == sentences
          ? _value._sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<SentencePair>,
      currentSentenceIndex: null == currentSentenceIndex
          ? _value.currentSentenceIndex
          : currentSentenceIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentWordIndex: null == currentWordIndex
          ? _value.currentWordIndex
          : currentWordIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentUserInput: null == currentUserInput
          ? _value.currentUserInput
          : currentUserInput // ignore: cast_nullable_to_non_nullable
              as String,
      revealedIrishWords: null == revealedIrishWords
          ? _value._revealedIrishWords
          : revealedIrishWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      completedSentences: null == completedSentences
          ? _value._completedSentences
          : completedSentences // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      lessonState: null == lessonState
          ? _value.lessonState
          : lessonState // ignore: cast_nullable_to_non_nullable
              as LessonState,
      isCurrentWordCorrect: null == isCurrentWordCorrect
          ? _value.isCurrentWordCorrect
          : isCurrentWordCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      isWordRevealed: null == isWordRevealed
          ? _value.isWordRevealed
          : isWordRevealed // ignore: cast_nullable_to_non_nullable
              as bool,
      isShiftEnabled: null == isShiftEnabled
          ? _value.isShiftEnabled
          : isShiftEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isFadaEnabled: null == isFadaEnabled
          ? _value.isFadaEnabled
          : isFadaEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InteractiveExerciseStateImpl extends _InteractiveExerciseState {
  const _$InteractiveExerciseStateImpl(
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

  @override
  String toString() {
    return 'InteractiveExerciseState(sentences: $sentences, currentSentenceIndex: $currentSentenceIndex, currentWordIndex: $currentWordIndex, currentUserInput: $currentUserInput, revealedIrishWords: $revealedIrishWords, completedSentences: $completedSentences, lessonState: $lessonState, isCurrentWordCorrect: $isCurrentWordCorrect, isWordRevealed: $isWordRevealed, isShiftEnabled: $isShiftEnabled, isFadaEnabled: $isFadaEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractiveExerciseStateImpl &&
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

  /// Create a copy of InteractiveExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractiveExerciseStateImplCopyWith<_$InteractiveExerciseStateImpl>
      get copyWith => __$$InteractiveExerciseStateImplCopyWithImpl<
          _$InteractiveExerciseStateImpl>(this, _$identity);
}

abstract class _InteractiveExerciseState extends InteractiveExerciseState {
  const factory _InteractiveExerciseState(
      {required final List<SentencePair> sentences,
      required final int currentSentenceIndex,
      required final int currentWordIndex,
      required final String currentUserInput,
      required final List<String> revealedIrishWords,
      required final List<bool> completedSentences,
      required final LessonState lessonState,
      required final bool isCurrentWordCorrect,
      required final bool isWordRevealed,
      required final bool isShiftEnabled,
      required final bool isFadaEnabled}) = _$InteractiveExerciseStateImpl;
  const _InteractiveExerciseState._() : super._();

  @override
  List<SentencePair> get sentences;
  @override
  int get currentSentenceIndex;
  @override
  int get currentWordIndex;
  @override
  String get currentUserInput;
  @override
  List<String> get revealedIrishWords;
  @override
  List<bool> get completedSentences;
  @override
  LessonState get lessonState;
  @override
  bool get isCurrentWordCorrect;
  @override
  bool get isWordRevealed;
  @override
  bool get isShiftEnabled;
  @override
  bool get isFadaEnabled;

  /// Create a copy of InteractiveExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteractiveExerciseStateImplCopyWith<_$InteractiveExerciseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
