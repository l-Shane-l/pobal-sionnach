// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Lap {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get startMs => throw _privateConstructorUsedError;
  int? get endMs => throw _privateConstructorUsedError;
  int get extras => throw _privateConstructorUsedError;

  /// Create a copy of Lap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LapCopyWith<Lap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LapCopyWith<$Res> {
  factory $LapCopyWith(Lap value, $Res Function(Lap) then) =
      _$LapCopyWithImpl<$Res, Lap>;
  @useResult
  $Res call({String id, String label, int startMs, int? endMs, int extras});
}

/// @nodoc
class _$LapCopyWithImpl<$Res, $Val extends Lap> implements $LapCopyWith<$Res> {
  _$LapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? startMs = null,
    Object? endMs = freezed,
    Object? extras = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      startMs: null == startMs
          ? _value.startMs
          : startMs // ignore: cast_nullable_to_non_nullable
              as int,
      endMs: freezed == endMs
          ? _value.endMs
          : endMs // ignore: cast_nullable_to_non_nullable
              as int?,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LapImplCopyWith<$Res> implements $LapCopyWith<$Res> {
  factory _$$LapImplCopyWith(_$LapImpl value, $Res Function(_$LapImpl) then) =
      __$$LapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label, int startMs, int? endMs, int extras});
}

/// @nodoc
class __$$LapImplCopyWithImpl<$Res> extends _$LapCopyWithImpl<$Res, _$LapImpl>
    implements _$$LapImplCopyWith<$Res> {
  __$$LapImplCopyWithImpl(_$LapImpl _value, $Res Function(_$LapImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? startMs = null,
    Object? endMs = freezed,
    Object? extras = null,
  }) {
    return _then(_$LapImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      startMs: null == startMs
          ? _value.startMs
          : startMs // ignore: cast_nullable_to_non_nullable
              as int,
      endMs: freezed == endMs
          ? _value.endMs
          : endMs // ignore: cast_nullable_to_non_nullable
              as int?,
      extras: null == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LapImpl extends _Lap {
  const _$LapImpl(
      {required this.id,
      required this.label,
      required this.startMs,
      this.endMs,
      this.extras = 0})
      : super._();

  @override
  final String id;
  @override
  final String label;
  @override
  final int startMs;
  @override
  final int? endMs;
  @override
  @JsonKey()
  final int extras;

  @override
  String toString() {
    return 'Lap(id: $id, label: $label, startMs: $startMs, endMs: $endMs, extras: $extras)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.startMs, startMs) || other.startMs == startMs) &&
            (identical(other.endMs, endMs) || other.endMs == endMs) &&
            (identical(other.extras, extras) || other.extras == extras));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, startMs, endMs, extras);

  /// Create a copy of Lap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LapImplCopyWith<_$LapImpl> get copyWith =>
      __$$LapImplCopyWithImpl<_$LapImpl>(this, _$identity);
}

abstract class _Lap extends Lap {
  const factory _Lap(
      {required final String id,
      required final String label,
      required final int startMs,
      final int? endMs,
      final int extras}) = _$LapImpl;
  const _Lap._() : super._();

  @override
  String get id;
  @override
  String get label;
  @override
  int get startMs;
  @override
  int? get endMs;
  @override
  int get extras;

  /// Create a copy of Lap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LapImplCopyWith<_$LapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TimerState {
  bool get running => throw _privateConstructorUsedError;
  int get startedEpochMs => throw _privateConstructorUsedError;
  int get elapsedMs => throw _privateConstructorUsedError;
  List<Lap> get laps => throw _privateConstructorUsedError;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
  @useResult
  $Res call({bool running, int startedEpochMs, int elapsedMs, List<Lap> laps});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? running = null,
    Object? startedEpochMs = null,
    Object? elapsedMs = null,
    Object? laps = null,
  }) {
    return _then(_value.copyWith(
      running: null == running
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as bool,
      startedEpochMs: null == startedEpochMs
          ? _value.startedEpochMs
          : startedEpochMs // ignore: cast_nullable_to_non_nullable
              as int,
      elapsedMs: null == elapsedMs
          ? _value.elapsedMs
          : elapsedMs // ignore: cast_nullable_to_non_nullable
              as int,
      laps: null == laps
          ? _value.laps
          : laps // ignore: cast_nullable_to_non_nullable
              as List<Lap>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerStateImplCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$TimerStateImplCopyWith(
          _$TimerStateImpl value, $Res Function(_$TimerStateImpl) then) =
      __$$TimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool running, int startedEpochMs, int elapsedMs, List<Lap> laps});
}

/// @nodoc
class __$$TimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStateImpl>
    implements _$$TimerStateImplCopyWith<$Res> {
  __$$TimerStateImplCopyWithImpl(
      _$TimerStateImpl _value, $Res Function(_$TimerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? running = null,
    Object? startedEpochMs = null,
    Object? elapsedMs = null,
    Object? laps = null,
  }) {
    return _then(_$TimerStateImpl(
      running: null == running
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as bool,
      startedEpochMs: null == startedEpochMs
          ? _value.startedEpochMs
          : startedEpochMs // ignore: cast_nullable_to_non_nullable
              as int,
      elapsedMs: null == elapsedMs
          ? _value.elapsedMs
          : elapsedMs // ignore: cast_nullable_to_non_nullable
              as int,
      laps: null == laps
          ? _value._laps
          : laps // ignore: cast_nullable_to_non_nullable
              as List<Lap>,
    ));
  }
}

/// @nodoc

class _$TimerStateImpl extends _TimerState {
  const _$TimerStateImpl(
      {required this.running,
      required this.startedEpochMs,
      required this.elapsedMs,
      required final List<Lap> laps})
      : _laps = laps,
        super._();

  @override
  final bool running;
  @override
  final int startedEpochMs;
  @override
  final int elapsedMs;
  final List<Lap> _laps;
  @override
  List<Lap> get laps {
    if (_laps is EqualUnmodifiableListView) return _laps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_laps);
  }

  @override
  String toString() {
    return 'TimerState(running: $running, startedEpochMs: $startedEpochMs, elapsedMs: $elapsedMs, laps: $laps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStateImpl &&
            (identical(other.running, running) || other.running == running) &&
            (identical(other.startedEpochMs, startedEpochMs) ||
                other.startedEpochMs == startedEpochMs) &&
            (identical(other.elapsedMs, elapsedMs) ||
                other.elapsedMs == elapsedMs) &&
            const DeepCollectionEquality().equals(other._laps, _laps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, running, startedEpochMs,
      elapsedMs, const DeepCollectionEquality().hash(_laps));

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      __$$TimerStateImplCopyWithImpl<_$TimerStateImpl>(this, _$identity);
}

abstract class _TimerState extends TimerState {
  const factory _TimerState(
      {required final bool running,
      required final int startedEpochMs,
      required final int elapsedMs,
      required final List<Lap> laps}) = _$TimerStateImpl;
  const _TimerState._() : super._();

  @override
  bool get running;
  @override
  int get startedEpochMs;
  @override
  int get elapsedMs;
  @override
  List<Lap> get laps;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
