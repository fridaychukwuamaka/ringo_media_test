// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calender_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalenderPageState {
  DateTime? get focusDate => throw _privateConstructorUsedError;
  int get timeLineIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalenderPageStateCopyWith<CalenderPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderPageStateCopyWith<$Res> {
  factory $CalenderPageStateCopyWith(
          CalenderPageState value, $Res Function(CalenderPageState) then) =
      _$CalenderPageStateCopyWithImpl<$Res, CalenderPageState>;
  @useResult
  $Res call({DateTime? focusDate, int timeLineIndex});
}

/// @nodoc
class _$CalenderPageStateCopyWithImpl<$Res, $Val extends CalenderPageState>
    implements $CalenderPageStateCopyWith<$Res> {
  _$CalenderPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusDate = freezed,
    Object? timeLineIndex = null,
  }) {
    return _then(_value.copyWith(
      focusDate: freezed == focusDate
          ? _value.focusDate
          : focusDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeLineIndex: null == timeLineIndex
          ? _value.timeLineIndex
          : timeLineIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalenderPageStateImplCopyWith<$Res>
    implements $CalenderPageStateCopyWith<$Res> {
  factory _$$CalenderPageStateImplCopyWith(_$CalenderPageStateImpl value,
          $Res Function(_$CalenderPageStateImpl) then) =
      __$$CalenderPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? focusDate, int timeLineIndex});
}

/// @nodoc
class __$$CalenderPageStateImplCopyWithImpl<$Res>
    extends _$CalenderPageStateCopyWithImpl<$Res, _$CalenderPageStateImpl>
    implements _$$CalenderPageStateImplCopyWith<$Res> {
  __$$CalenderPageStateImplCopyWithImpl(_$CalenderPageStateImpl _value,
      $Res Function(_$CalenderPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusDate = freezed,
    Object? timeLineIndex = null,
  }) {
    return _then(_$CalenderPageStateImpl(
      focusDate: freezed == focusDate
          ? _value.focusDate
          : focusDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeLineIndex: null == timeLineIndex
          ? _value.timeLineIndex
          : timeLineIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CalenderPageStateImpl implements _CalenderPageState {
  const _$CalenderPageStateImpl(
      {required this.focusDate, this.timeLineIndex = 0});

  @override
  final DateTime? focusDate;
  @override
  @JsonKey()
  final int timeLineIndex;

  @override
  String toString() {
    return 'CalenderPageState(focusDate: $focusDate, timeLineIndex: $timeLineIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalenderPageStateImpl &&
            (identical(other.focusDate, focusDate) ||
                other.focusDate == focusDate) &&
            (identical(other.timeLineIndex, timeLineIndex) ||
                other.timeLineIndex == timeLineIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, focusDate, timeLineIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalenderPageStateImplCopyWith<_$CalenderPageStateImpl> get copyWith =>
      __$$CalenderPageStateImplCopyWithImpl<_$CalenderPageStateImpl>(
          this, _$identity);
}

abstract class _CalenderPageState implements CalenderPageState {
  const factory _CalenderPageState(
      {required final DateTime? focusDate,
      final int timeLineIndex}) = _$CalenderPageStateImpl;

  @override
  DateTime? get focusDate;
  @override
  int get timeLineIndex;
  @override
  @JsonKey(ignore: true)
  _$$CalenderPageStateImplCopyWith<_$CalenderPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
