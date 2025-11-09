import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sionnach_ui_community/features/lesson/model/sentence_pair/sentence_pair.dart';

import '../../../base/timer/controller/timer_controller.dart';
import 'state/timed_exercise_state.dart';
import '../../../base/model/lesson_state.dart';

part 'timed_exercise_controller.g.dart';

@riverpod
class TimedExerciseController extends _$TimedExerciseController {
  @override
  TimedExerciseState build(List<SentencePair> sentences) {
    // Initialize with the first sentence
    final firstSentence = sentences.isNotEmpty ? sentences.first : null;

    return TimedExerciseState.initial(
      sentences: sentences,
      currentSentence: firstSentence,
    );
  }

  void beginTiming() {
    final timer = ref.read(timerControllerProvider.notifier);
    timer.reset();
    timer.startExercise(id: 'word:0', label: ' ...');
  }

  void onKeyPressed(String key) {
    if (state.lessonState == LessonState.completed) return;

    if (key.toLowerCase() ==
        state.currentTargetWord[state.currentUserInput.length].toLowerCase()) {
      state = state.copyWith(
        currentUserInput: state.currentUserInput + key,
        isCurrentWordCorrect: true,
      );

      if (state.currentUserInput.length == state.currentTargetWord.length) {
        // Word complete logic is handled in onCorrectWordSubmitted
      }
    } else {
      //Incorrect key
      final timer = ref.read(timerControllerProvider.notifier);
      timer.lapAddExtra(); //Example usage for tallying in extras
      state = state.copyWith(isCurrentWordCorrect: false);
    }
  }

  void onCorrectWordSubmitted() {
    final timer = ref.read(timerControllerProvider.notifier);

    final newRevealedWords = List<String>.from(state.revealedIrishWords)
      ..add(state.currentTargetWord);

    if (newRevealedWords.length ==
        state.currentIrishSentence.split(' ').length) {
      // If this was the last sentence, stop the exercise timer
      if (state.isLastSentence) {
        timer.endLap(
            labelUpdate:
                state.currentSentence.irish.split(" ")[state.currentWordIndex]);
        timer.stopExercise();
      }
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
      // Start next word lap immediately
      final nextWordIndex = state.currentWordIndex + 1;
      timer.lapToNext(
          nextId: 'word: $nextWordIndex',
          nextLabel: ' ...',
          updateLabel:
              state.currentSentence.irish.split(" ")[state.currentWordIndex]);

      state = state.copyWith(
        revealedIrishWords: newRevealedWords,
        currentUserInput: '',
        currentWordIndex: nextWordIndex,
      );
    }
  }

  void nextSentence() {
    if (state.isLastSentence) {
      // Handle lesson completion if necessary
      return;
    }

    final nextIndex = state.currentSentenceIndex + 1;

    // Begin timing for next sentence’s first word
    ref.read(timerControllerProvider.notifier).lapToNext(
        nextId: 'word: $nextIndex',
        nextLabel: ' ...',
        updateLabel: state.sentences[state.currentSentenceIndex].irish
            .split(" ")[state.currentWordIndex]);

    state = TimedExerciseState.initial(
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
    final nextIndex = state.currentSentenceIndex + 1;

    // Begin timing for next sentence’s first word
    ref.read(timerControllerProvider.notifier).lapToNext(
        nextId: 'word: $nextIndex',
        nextLabel: ' ...',
        updateLabel: state.sentences[state.currentSentenceIndex].irish
            .split(" ")[state.currentWordIndex]);

    state = state.copyWith(isWordRevealed: true);
  }
}
