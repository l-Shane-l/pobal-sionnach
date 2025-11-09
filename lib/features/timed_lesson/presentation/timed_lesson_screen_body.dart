// lib/presentation/widgets/lesson_screen_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sionnach_ui_community/features/lesson/model/sentence_pair/sentence_pair.dart';
import 'package:sionnach_ui_community/base/model/lesson_state.dart';
import 'package:sionnach_ui_community/base/widget/current_word_input_display.dart';
import 'package:sionnach_ui_community/base/widget/custom_keyboard_widget.dart';
import 'package:sionnach_ui_community/base/widget/lesson_info_card.dart';
import 'package:sionnach_ui_community/base/widget/sentence_complete_celebration.dart';
import 'package:sionnach_ui_community/base/widget/simple_irish_sentence_display.dart';

import '../controller/timed_exercise_controller.dart';
import 'widget/side_panel.dart';

//Internal provider to help manage initial timing state
// with respect to the screen lifecycle
final timingStartedProvider = StateProvider<bool>((ref) => false);

class TimedLessonScreenBody extends ConsumerWidget {
  final List<SentencePair> sentences;
  final VoidCallback onLessonComplete;

  const TimedLessonScreenBody({
    super.key,
    required this.sentences,
    required this.onLessonComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final started = ref.watch(timingStartedProvider);

    final exerciseProvider = timedExerciseControllerProvider(sentences);
    final state = ref.watch(exerciseProvider);
    final controller = ref.read(exerciseProvider.notifier);

    if (!started) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!ref.read(timingStartedProvider)) {
          ref.read(timingStartedProvider.notifier).state = true;
          controller.beginTiming();
        }
      });
    }

    ref.listen(exerciseProvider, (previous, next) {
      if (previous == null || previous.sentences != next.sentences) {
        //TODO as type check
        controller.beginTiming();
      }
    });

    final mainContent = Column(
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

    return Stack(
      children: [
        Positioned.fill(child: mainContent),
        const Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: SizedBox(
            height: double.infinity,
            child: IgnorePointer(
              ignoring: false, // allow interaction with the panel
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: SidePanel(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
