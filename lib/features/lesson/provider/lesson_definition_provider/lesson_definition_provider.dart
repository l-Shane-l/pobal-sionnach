import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sionnach_ui_community/features/lesson/model/lesson_definition/lesson_definition.dart';
import 'package:sionnach_ui_community/features/lesson/model/sentence_pair/sentence_pair.dart';

// Dummy placeholder data for UI demonstration only
// In the real app, this would be replaced with actual lesson content from the backend
final _dummySentences = [
  const SentencePair(irish: "Dia duit", english: "Hello"),
  const SentencePair(irish: "Conas atá tú?", english: "How are you?"),
  const SentencePair(irish: "Go raibh maith agat", english: "Thank you"),
];

// Dummy implementation of the lessonDefinitionProvider.
// Returns hardcoded placeholder data for UI testing only.
final lessonDefinitionProvider = FutureProvider.family
    .autoDispose<LessonDefinition, String>((ref, String lessonId) async {
  // Simulate a network delay
  await Future.delayed(const Duration(milliseconds: 250));

  return LessonDefinition(
    lessonId: lessonId,
    lessonName: "UI Demo Lesson",
    sentencePairs: _dummySentences,
  );
});
