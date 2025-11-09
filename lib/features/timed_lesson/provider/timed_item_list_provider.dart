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

final _dummyWords1 = [
  const SentencePair(irish: "Glas", english: "Green"),
  const SentencePair(irish: "Bán", english: "White"),
  const SentencePair(irish: "Oráiste", english: "Orange"),
];

final _dummyWords2 = [
  const SentencePair(irish: "Amháine", english: "One"),
  const SentencePair(irish: "Beirt", english: "Two"),
  const SentencePair(irish: "Trí", english: "Three"),
];

// Dummy implementation of the lessonDefinitionProvider.
// Returns hardcoded placeholder data for UI testing only.
final timedItemListProvider = FutureProvider.family
    .autoDispose<LessonDefinition, String>((ref, String lessonId) async {
  // Simulate a network delay
  await Future.delayed(const Duration(milliseconds: 250));

  if (lessonId == 'color') {
    return LessonDefinition(
      lessonId: lessonId,
      lessonName: "UI Demo Colors",
      sentencePairs: _dummyWords1,
    );
  } else if (lessonId == 'number') {
    return LessonDefinition(
      lessonId: lessonId,
      lessonName: "UI Demo Numbers",
      sentencePairs: _dummyWords2,
    );
  } else {
    return LessonDefinition(
      lessonId: lessonId,
      lessonName: "UI Demo Lesson",
      sentencePairs: _dummySentences,
    );
  }
});
