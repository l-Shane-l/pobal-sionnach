// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LessonDefinition {
  String get lessonId => throw _privateConstructorUsedError;
  String get lessonName => throw _privateConstructorUsedError;
  List<SentencePair> get sentencePairs => throw _privateConstructorUsedError;

  /// Create a copy of LessonDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonDefinitionCopyWith<LessonDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonDefinitionCopyWith<$Res> {
  factory $LessonDefinitionCopyWith(
          LessonDefinition value, $Res Function(LessonDefinition) then) =
      _$LessonDefinitionCopyWithImpl<$Res, LessonDefinition>;
  @useResult
  $Res call(
      {String lessonId, String lessonName, List<SentencePair> sentencePairs});
}

/// @nodoc
class _$LessonDefinitionCopyWithImpl<$Res, $Val extends LessonDefinition>
    implements $LessonDefinitionCopyWith<$Res> {
  _$LessonDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? lessonName = null,
    Object? sentencePairs = null,
  }) {
    return _then(_value.copyWith(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonName: null == lessonName
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      sentencePairs: null == sentencePairs
          ? _value.sentencePairs
          : sentencePairs // ignore: cast_nullable_to_non_nullable
              as List<SentencePair>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonDefinitionImplCopyWith<$Res>
    implements $LessonDefinitionCopyWith<$Res> {
  factory _$$LessonDefinitionImplCopyWith(_$LessonDefinitionImpl value,
          $Res Function(_$LessonDefinitionImpl) then) =
      __$$LessonDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lessonId, String lessonName, List<SentencePair> sentencePairs});
}

/// @nodoc
class __$$LessonDefinitionImplCopyWithImpl<$Res>
    extends _$LessonDefinitionCopyWithImpl<$Res, _$LessonDefinitionImpl>
    implements _$$LessonDefinitionImplCopyWith<$Res> {
  __$$LessonDefinitionImplCopyWithImpl(_$LessonDefinitionImpl _value,
      $Res Function(_$LessonDefinitionImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? lessonName = null,
    Object? sentencePairs = null,
  }) {
    return _then(_$LessonDefinitionImpl(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonName: null == lessonName
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      sentencePairs: null == sentencePairs
          ? _value._sentencePairs
          : sentencePairs // ignore: cast_nullable_to_non_nullable
              as List<SentencePair>,
    ));
  }
}

/// @nodoc

class _$LessonDefinitionImpl implements _LessonDefinition {
  const _$LessonDefinitionImpl(
      {required this.lessonId,
      required this.lessonName,
      required final List<SentencePair> sentencePairs})
      : _sentencePairs = sentencePairs;

  @override
  final String lessonId;
  @override
  final String lessonName;
  final List<SentencePair> _sentencePairs;
  @override
  List<SentencePair> get sentencePairs {
    if (_sentencePairs is EqualUnmodifiableListView) return _sentencePairs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentencePairs);
  }

  @override
  String toString() {
    return 'LessonDefinition(lessonId: $lessonId, lessonName: $lessonName, sentencePairs: $sentencePairs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonDefinitionImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.lessonName, lessonName) ||
                other.lessonName == lessonName) &&
            const DeepCollectionEquality()
                .equals(other._sentencePairs, _sentencePairs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lessonId, lessonName,
      const DeepCollectionEquality().hash(_sentencePairs));

  /// Create a copy of LessonDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonDefinitionImplCopyWith<_$LessonDefinitionImpl> get copyWith =>
      __$$LessonDefinitionImplCopyWithImpl<_$LessonDefinitionImpl>(
          this, _$identity);
}

abstract class _LessonDefinition implements LessonDefinition {
  const factory _LessonDefinition(
          {required final String lessonId,
          required final String lessonName,
          required final List<SentencePair> sentencePairs}) =
      _$LessonDefinitionImpl;

  @override
  String get lessonId;
  @override
  String get lessonName;
  @override
  List<SentencePair> get sentencePairs;

  /// Create a copy of LessonDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonDefinitionImplCopyWith<_$LessonDefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
