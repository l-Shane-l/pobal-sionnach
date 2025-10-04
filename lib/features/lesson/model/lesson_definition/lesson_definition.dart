import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sionnach_ui_community/features/lesson/model/sentence_pair/sentence_pair.dart';

part 'lesson_definition.freezed.dart';

@freezed
abstract class LessonDefinition with _$LessonDefinition {
  const factory LessonDefinition({
    required String lessonId,
    required String lessonName,
    required List<SentencePair> sentencePairs,
  }) = _LessonDefinition;
}
