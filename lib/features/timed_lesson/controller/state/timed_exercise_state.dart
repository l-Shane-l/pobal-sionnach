import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sionnach_ui_community/features/lesson/model/sentence_pair/sentence_pair.dart';
import 'package:sionnach_ui_community/base/model/lesson_state.dart';

part 'timed_exercise_state.freezed.dart';

@freezed
class TimedExerciseState with _$TimedExerciseState {
  const TimedExerciseState._();

  const factory TimedExerciseState({
    required List<SentencePair> sentences,
    required int currentSentenceIndex,
    required int currentWordIndex,
    required String currentUserInput,
    required List<String> revealedIrishWords,
    required List<bool> completedSentences,
    required LessonState lessonState,
    required bool isCurrentWordCorrect,
    required bool isWordRevealed,
    required bool isShiftEnabled,
    required bool isFadaEnabled,
  }) = _TimedExerciseState;

  factory TimedExerciseState.initial({
    required List<SentencePair> sentences,
    SentencePair? currentSentence,
  }) {
    return TimedExerciseState(
      sentences: sentences,
      currentSentenceIndex:
          currentSentence != null ? sentences.indexOf(currentSentence) : 0,
      currentWordIndex: 0,
      currentUserInput: '',
      revealedIrishWords: [],
      completedSentences: List.filled(sentences.length, false),
      lessonState: LessonState.playing,
      isCurrentWordCorrect: true,
      isWordRevealed: false,
      isShiftEnabled: false,
      isFadaEnabled: false,
    );
  }

  SentencePair get currentSentence => sentences[currentSentenceIndex];
  String get currentIrishSentence => currentSentence.irish;
  String get currentEnglishSentence => currentSentence.english;
  List<String> get currentIrishWords => currentIrishSentence.split(' ');
  String get currentTargetWord => currentIrishWords[currentWordIndex];
  int get totalSentences => sentences.length;
  bool get isLastSentence => currentSentenceIndex >= sentences.length - 1;
}
