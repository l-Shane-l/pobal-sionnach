// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sentence_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SentencePair {
  String get english;
  String get irish;

  /// Create a copy of SentencePair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SentencePairCopyWith<SentencePair> get copyWith =>
      _$SentencePairCopyWithImpl<SentencePair>(
          this as SentencePair, _$identity);

  /// Serializes this SentencePair to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SentencePair &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.irish, irish) || other.irish == irish));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, english, irish);

  @override
  String toString() {
    return 'SentencePair(english: $english, irish: $irish)';
  }
}

/// @nodoc
abstract mixin class $SentencePairCopyWith<$Res> {
  factory $SentencePairCopyWith(
          SentencePair value, $Res Function(SentencePair) _then) =
      _$SentencePairCopyWithImpl;
  @useResult
  $Res call({String english, String irish});
}

/// @nodoc
class _$SentencePairCopyWithImpl<$Res> implements $SentencePairCopyWith<$Res> {
  _$SentencePairCopyWithImpl(this._self, this._then);

  final SentencePair _self;
  final $Res Function(SentencePair) _then;

  /// Create a copy of SentencePair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? english = null,
    Object? irish = null,
  }) {
    return _then(_self.copyWith(
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      irish: null == irish
          ? _self.irish
          : irish // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SentencePair].
extension SentencePairPatterns on SentencePair {
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
    TResult Function(_SentencePair value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SentencePair() when $default != null:
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
    TResult Function(_SentencePair value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SentencePair():
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
    TResult? Function(_SentencePair value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SentencePair() when $default != null:
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
    TResult Function(String english, String irish)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SentencePair() when $default != null:
        return $default(_that.english, _that.irish);
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
    TResult Function(String english, String irish) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SentencePair():
        return $default(_that.english, _that.irish);
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
    TResult? Function(String english, String irish)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SentencePair() when $default != null:
        return $default(_that.english, _that.irish);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SentencePair extends SentencePair {
  const _SentencePair({this.english = '', this.irish = ''}) : super._();
  factory _SentencePair.fromJson(Map<String, dynamic> json) =>
      _$SentencePairFromJson(json);

  @override
  @JsonKey()
  final String english;
  @override
  @JsonKey()
  final String irish;

  /// Create a copy of SentencePair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SentencePairCopyWith<_SentencePair> get copyWith =>
      __$SentencePairCopyWithImpl<_SentencePair>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SentencePairToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SentencePair &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.irish, irish) || other.irish == irish));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, english, irish);

  @override
  String toString() {
    return 'SentencePair(english: $english, irish: $irish)';
  }
}

/// @nodoc
abstract mixin class _$SentencePairCopyWith<$Res>
    implements $SentencePairCopyWith<$Res> {
  factory _$SentencePairCopyWith(
          _SentencePair value, $Res Function(_SentencePair) _then) =
      __$SentencePairCopyWithImpl;
  @override
  @useResult
  $Res call({String english, String irish});
}

/// @nodoc
class __$SentencePairCopyWithImpl<$Res>
    implements _$SentencePairCopyWith<$Res> {
  __$SentencePairCopyWithImpl(this._self, this._then);

  final _SentencePair _self;
  final $Res Function(_SentencePair) _then;

  /// Create a copy of SentencePair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? english = null,
    Object? irish = null,
  }) {
    return _then(_SentencePair(
      english: null == english
          ? _self.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      irish: null == irish
          ? _self.irish
          : irish // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
