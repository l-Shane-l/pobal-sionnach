// import 'package:flutter/foundation.dart'; // Keep this commented out as it resolved the DiagnosticableTreeMixin errors
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentence_pair.freezed.dart';
part 'sentence_pair.g.dart';

@freezed
abstract class SentencePair with _$SentencePair {
  // Made this class ABSTRACT

  // Added a private empty constructor. This is often required by Freezed
  // when the shell class is abstract and you use factory constructors,
  // especially if there was any intention (even by generated code from Diagnosticable)
  // to add or override methods in the shell.
  const SentencePair._();

  const factory SentencePair({
    @Default('') String english,
    @Default('') String irish,
  }) =
      _SentencePair; // This points to the concrete implementation Freezed generates

  factory SentencePair.fromJson(Map<String, dynamic> json) =>
      _$SentencePairFromJson(json);
}
