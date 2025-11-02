// lib/data/controllers/interactive_exercise_controller.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sionnach_ui_community/features/lesson/model/sentence_pair/sentence_pair.dart';
import 'package:sionnach_ui_community/features/lesson/presentation/state/interactive_exercise_state.dart';

part 'interactive_exercise_controller.g.dart';

@riverpod
class InteractiveExerciseController extends _$InteractiveExerciseController {
  @override
  InteractiveExerciseState build(List<SentencePair> sentences) {
    // Initialize with the first sentence
    final firstSentence = sentences.isNotEmpty ? sentences.first : null;
    return InteractiveExerciseState.initial(
      sentences: sentences,
      currentSentence: firstSentence,
    );
  }

  void onKeyPressed(String key) {
    if (state.lessonState == LessonState.completed) return;

    if ((state.currentUserInput + key).length >
        state.currentTargetWord.length) {
      // Do nothing if input exceeds target word length) {
    } else if (key.toLowerCase() ==
        state.currentTargetWord[state.currentUserInput.length].toLowerCase()) {
      state = state.copyWith(
        currentUserInput: state.currentUserInput + key,
        isCurrentWordCorrect: true,
      );

      if (state.currentUserInput.length == state.currentTargetWord.length) {
        // Word complete logic is handled in onCorrectWordSubmitted
      }
    } else {
      state = state.copyWith(
          currentUserInput: state.currentUserInput + key,
          isCurrentWordCorrect: false);
    }
  }

  void onCorrectWordSubmitted() {
    final newRevealedWords = List<String>.from(state.revealedIrishWords)
      ..add(state.currentTargetWord);

    if (newRevealedWords.length ==
        state.currentIrishSentence.split(' ').length) {
      // Sentence complete
      final newCompletedSentences = List<bool>.from(state.completedSentences);
      newCompletedSentences[state.currentSentenceIndex] = true;

      state = state.copyWith(
        revealedIrishWords: newRevealedWords,
        currentUserInput: '',
        lessonState: LessonState.completed,
        completedSentences: newCompletedSentences,
      );
    } else {
      // More words in the sentence
      state = state.copyWith(
        revealedIrishWords: newRevealedWords,
        currentUserInput: '',
        currentWordIndex: state.currentWordIndex + 1,
      );
    }
  }

  void nextSentence() {
    if (state.isLastSentence) {
      // Handle lesson completion if necessary
      return;
    }

    final nextIndex = state.currentSentenceIndex + 1;
    state = InteractiveExerciseState.initial(
      sentences: state.sentences,
      currentSentence: state.sentences[nextIndex],
    ).copyWith(
      currentSentenceIndex: nextIndex,
      completedSentences: state.completedSentences,
    );
  }

  void onBackspace() {
    if (state.currentUserInput.isNotEmpty) {
      state = state.copyWith(
        currentUserInput: state.currentUserInput
            .substring(0, state.currentUserInput.length - 1),
      );
    }
  }

  void revealWord() {
    state = state.copyWith(isWordRevealed: true);
  }
}
