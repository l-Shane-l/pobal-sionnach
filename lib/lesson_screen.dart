import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sionnach_ui_community/features/lesson/widget/lesson_screen_body.dart';
import 'package:sionnach_ui_community/features/lesson/provider/lesson_definition_provider/lesson_definition_provider.dart';

class LessonScreen extends ConsumerWidget {
  final String plantedTreeId;
  const LessonScreen({required this.plantedTreeId, super.key});

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
          return LessonScreenBody(
            sentences: lessonDefinition.sentencePairs,
            onLessonComplete: () {
              print("Lesson Complete!");
            },
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
