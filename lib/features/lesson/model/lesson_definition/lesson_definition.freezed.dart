// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LessonDefinition {
  String get lessonId;
  String get lessonName;
  List<SentencePair> get sentencePairs;

  /// Create a copy of LessonDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LessonDefinitionCopyWith<LessonDefinition> get copyWith =>
      _$LessonDefinitionCopyWithImpl<LessonDefinition>(
          this as LessonDefinition, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LessonDefinition &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.lessonName, lessonName) ||
                other.lessonName == lessonName) &&
            const DeepCollectionEquality()
                .equals(other.sentencePairs, sentencePairs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lessonId, lessonName,
      const DeepCollectionEquality().hash(sentencePairs));

  @override
  String toString() {
    return 'LessonDefinition(lessonId: $lessonId, lessonName: $lessonName, sentencePairs: $sentencePairs)';
  }
}

/// @nodoc
abstract mixin class $LessonDefinitionCopyWith<$Res> {
  factory $LessonDefinitionCopyWith(
          LessonDefinition value, $Res Function(LessonDefinition) _then) =
      _$LessonDefinitionCopyWithImpl;
  @useResult
  $Res call(
      {String lessonId, String lessonName, List<SentencePair> sentencePairs});
}

/// @nodoc
class _$LessonDefinitionCopyWithImpl<$Res>
    implements $LessonDefinitionCopyWith<$Res> {
  _$LessonDefinitionCopyWithImpl(this._self, this._then);

  final LessonDefinition _self;
  final $Res Function(LessonDefinition) _then;

  /// Create a copy of LessonDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? lessonName = null,
    Object? sentencePairs = null,
  }) {
    return _then(_self.copyWith(
      lessonId: null == lessonId
          ? _self.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonName: null == lessonName
          ? _self.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      sentencePairs: null == sentencePairs
          ? _self.sentencePairs
          : sentencePairs // ignore: cast_nullable_to_non_nullable
              as List<SentencePair>,
    ));
  }
}

/// Adds pattern-matching-related methods to [LessonDefinition].
extension LessonDefinitionPatterns on LessonDefinition {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LessonDefinition value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LessonDefinition() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LessonDefinition value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LessonDefinition():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LessonDefinition value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LessonDefinition() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String lessonId, String lessonName,
            List<SentencePair> sentencePairs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LessonDefinition() when $default != null:
        return $default(_that.lessonId, _that.lessonName, _that.sentencePairs);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String lessonId, String lessonName,
            List<SentencePair> sentencePairs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LessonDefinition():
        return $default(_that.lessonId, _that.lessonName, _that.sentencePairs);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String lessonId, String lessonName,
            List<SentencePair> sentencePairs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LessonDefinition() when $default != null:
        return $default(_that.lessonId, _that.lessonName, _that.sentencePairs);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LessonDefinition implements LessonDefinition {
  const _LessonDefinition(
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

  /// Create a copy of LessonDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LessonDefinitionCopyWith<_LessonDefinition> get copyWith =>
      __$LessonDefinitionCopyWithImpl<_LessonDefinition>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LessonDefinition &&
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

  @override
  String toString() {
    return 'LessonDefinition(lessonId: $lessonId, lessonName: $lessonName, sentencePairs: $sentencePairs)';
  }
}

/// @nodoc
abstract mixin class _$LessonDefinitionCopyWith<$Res>
    implements $LessonDefinitionCopyWith<$Res> {
  factory _$LessonDefinitionCopyWith(
          _LessonDefinition value, $Res Function(_LessonDefinition) _then) =
      __$LessonDefinitionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String lessonId, String lessonName, List<SentencePair> sentencePairs});
}

/// @nodoc
class __$LessonDefinitionCopyWithImpl<$Res>
    implements _$LessonDefinitionCopyWith<$Res> {
  __$LessonDefinitionCopyWithImpl(this._self, this._then);

  final _LessonDefinition _self;
  final $Res Function(_LessonDefinition) _then;

  /// Create a copy of LessonDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lessonId = null,
    Object? lessonName = null,
    Object? sentencePairs = null,
  }) {
    return _then(_LessonDefinition(
      lessonId: null == lessonId
          ? _self.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      lessonName: null == lessonName
          ? _self.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      sentencePairs: null == sentencePairs
          ? _self._sentencePairs
          : sentencePairs // ignore: cast_nullable_to_non_nullable
              as List<SentencePair>,
    ));
  }
}

// dart format on
