// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rankings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RankingsState {
  List<List<RankingData>> get list => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RankingsStateCopyWith<RankingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingsStateCopyWith<$Res> {
  factory $RankingsStateCopyWith(
          RankingsState value, $Res Function(RankingsState) then) =
      _$RankingsStateCopyWithImpl<$Res, RankingsState>;
  @useResult
  $Res call({List<List<RankingData>> list, bool loading});
}

/// @nodoc
class _$RankingsStateCopyWithImpl<$Res, $Val extends RankingsState>
    implements $RankingsStateCopyWith<$Res> {
  _$RankingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<List<RankingData>>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RankingsStateCopyWith<$Res>
    implements $RankingsStateCopyWith<$Res> {
  factory _$$_RankingsStateCopyWith(
          _$_RankingsState value, $Res Function(_$_RankingsState) then) =
      __$$_RankingsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<RankingData>> list, bool loading});
}

/// @nodoc
class __$$_RankingsStateCopyWithImpl<$Res>
    extends _$RankingsStateCopyWithImpl<$Res, _$_RankingsState>
    implements _$$_RankingsStateCopyWith<$Res> {
  __$$_RankingsStateCopyWithImpl(
      _$_RankingsState _value, $Res Function(_$_RankingsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? loading = null,
  }) {
    return _then(_$_RankingsState(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<List<RankingData>>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RankingsState implements _RankingsState {
  const _$_RankingsState(
      {final List<List<RankingData>> list = const [], this.loading = false})
      : _list = list;

  final List<List<RankingData>> _list;
  @override
  @JsonKey()
  List<List<RankingData>> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'RankingsState(list: $list, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RankingsState &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RankingsStateCopyWith<_$_RankingsState> get copyWith =>
      __$$_RankingsStateCopyWithImpl<_$_RankingsState>(this, _$identity);
}

abstract class _RankingsState implements RankingsState {
  const factory _RankingsState(
      {final List<List<RankingData>> list,
      final bool loading}) = _$_RankingsState;

  @override
  List<List<RankingData>> get list;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$_RankingsStateCopyWith<_$_RankingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
