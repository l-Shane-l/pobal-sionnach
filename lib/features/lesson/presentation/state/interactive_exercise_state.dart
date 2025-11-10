import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sionnach_ui_community/features/lesson/model/sentence_pair/sentence_pair.dart';

part 'interactive_exercise_state.freezed.dart';

enum LessonState { playing, completed, finished }

@freezed
abstract class InteractiveExerciseState with _$InteractiveExerciseState {
  const InteractiveExerciseState._();

  const factory InteractiveExerciseState({
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
  }) = _InteractiveExerciseState;

  factory InteractiveExerciseState.initial({
    required List<SentencePair> sentences,
    SentencePair? currentSentence,
  }) {
    return InteractiveExerciseState(
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
