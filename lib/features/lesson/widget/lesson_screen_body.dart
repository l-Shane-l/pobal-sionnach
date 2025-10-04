// lib/presentation/widgets/lesson_screen_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sionnach_ui_community/features/lesson/model/sentence_pair/sentence_pair.dart';
import 'package:sionnach_ui_community/features/lesson/presentation/controller/interactive_exercise_controller.dart';
import 'package:sionnach_ui_community/features/lesson/presentation/state/interactive_exercise_state.dart';
import 'package:sionnach_ui_community/features/lesson/widget/current_word_input_display.dart';
import 'package:sionnach_ui_community/features/lesson/widget/custom_keyboard_widget.dart';
import 'package:sionnach_ui_community/features/lesson/widget/lesson_info_card.dart';
import 'package:sionnach_ui_community/features/lesson/widget/sentence_complete_celebration.dart';
import 'package:sionnach_ui_community/features/lesson/widget/simple_irish_sentence_display.dart';

class LessonScreenBody extends ConsumerWidget {
  final List<SentencePair> sentences;
  final VoidCallback onLessonComplete;

  const LessonScreenBody({
    super.key,
    required this.sentences,
    required this.onLessonComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseProvider =
        interactiveExerciseControllerProvider(sentences);
    final state = ref.watch(exerciseProvider);
    final controller = ref.read(exerciseProvider.notifier);

    return Column(
      children: [
        LessonInfoCard(
          totalSentences: state.totalSentences,
          currentSentenceIndex: state.currentSentenceIndex,
          completedSentences: state.completedSentences,
          englishText: state.currentEnglishSentence,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.lessonState == LessonState.completed)
                  SentenceCompleteCelebration(
                    onNextSentence: controller.nextSentence,
                    isLastSentence: state.isLastSentence,
                  ),
                if (state.lessonState != LessonState.completed)
                  Column(
                    children: [
                      SimpleIrishSentenceDisplay(
                          words: state.revealedIrishWords),
                      const SizedBox(height: 24),
                      CurrentWordInputDisplay(
                        targetWord: state.currentTargetWord,
                        userInput: state.currentUserInput,
                        isCorrect: state.isCurrentWordCorrect,
                        isRevealed: state.isWordRevealed,
                        onCorrect: (xp, words) {
                          controller.onCorrectWordSubmitted();
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        if (state.lessonState != LessonState.completed)
          CustomKeyboardWidget(
            onLetterTap: controller.onKeyPressed,
            onBackspaceTap: controller.onBackspace,
            onShiftTap: () {},
          ),
      ],
    );
  }
}
