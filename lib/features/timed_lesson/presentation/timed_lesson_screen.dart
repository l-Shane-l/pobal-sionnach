import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'timed_lesson_screen_body.dart';
import '../provider/timed_item_list_provider.dart';
import 'widget/panel_widget.dart';
import '../provider/selection_provider.dart';

class TimedLessonScreen extends ConsumerWidget {
  final String plantedTreeId;
  const TimedLessonScreen({required this.plantedTreeId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //UI Based Selection state
    final String? selection = ref.watch(selectionProvider);
    final lessonDefinitionAsync =
        ref.watch(timedItemListProvider(selection ?? plantedTreeId));

    return Scaffold(
      appBar: AppBar(
        title: lessonDefinitionAsync.when(
          data: (lessonDef) => Text(lessonDef.lessonName),
          loading: () => const Text("Loading..."),
          error: (e, st) => const Text("Error"),
        ),
      ),
      body: lessonDefinitionAsync.when(
        data: (lessonDefinition) {
          return Stack(
            children: [
              const Positioned.fill(child: PanelWidget()),
              Positioned.fill(
                  child: TimedLessonScreenBody(
                sentences: lessonDefinition.sentencePairs,
                onLessonComplete: () {
                  log("Lesson Complete!");
                },
              )),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text("Error loading lesson: $error"),
        ),
      ),
    );
  }
}
