import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'timed_lesson_screen_body.dart';
import '../../lesson/provider/lesson_definition_provider/lesson_definition_provider.dart';

class TimedLessonScreen extends ConsumerWidget {
  final String plantedTreeId;
  const TimedLessonScreen({required this.plantedTreeId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonDefinitionAsync =
        ref.watch(lessonDefinitionProvider(plantedTreeId));

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
