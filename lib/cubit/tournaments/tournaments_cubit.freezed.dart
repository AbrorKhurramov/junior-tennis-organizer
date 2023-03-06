// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tournaments_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TournamentsState {
  List<AcceptanceListData> get acceptanceList =>
      throw _privateConstructorUsedError;
  List<TournamentData> get tournamentDataList =>
      throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TournamentsStateCopyWith<TournamentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentsStateCopyWith<$Res> {
  factory $TournamentsStateCopyWith(
          TournamentsState value, $Res Function(TournamentsState) then) =
      _$TournamentsStateCopyWithImpl<$Res, TournamentsState>;
  @useResult
  $Res call(
      {List<AcceptanceListData> acceptanceList,
      List<TournamentData> tournamentDataList,
      bool loading});
}

/// @nodoc
class _$TournamentsStateCopyWithImpl<$Res, $Val extends TournamentsState>
    implements $TournamentsStateCopyWith<$Res> {
  _$TournamentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptanceList = null,
    Object? tournamentDataList = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      acceptanceList: null == acceptanceList
          ? _value.acceptanceList
          : acceptanceList // ignore: cast_nullable_to_non_nullable
              as List<AcceptanceListData>,
      tournamentDataList: null == tournamentDataList
          ? _value.tournamentDataList
          : tournamentDataList // ignore: cast_nullable_to_non_nullable
              as List<TournamentData>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TournamentsStateCopyWith<$Res>
    implements $TournamentsStateCopyWith<$Res> {
  factory _$$_TournamentsStateCopyWith(
          _$_TournamentsState value, $Res Function(_$_TournamentsState) then) =
      __$$_TournamentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AcceptanceListData> acceptanceList,
      List<TournamentData> tournamentDataList,
      bool loading});
}

/// @nodoc
class __$$_TournamentsStateCopyWithImpl<$Res>
    extends _$TournamentsStateCopyWithImpl<$Res, _$_TournamentsState>
    implements _$$_TournamentsStateCopyWith<$Res> {
  __$$_TournamentsStateCopyWithImpl(
      _$_TournamentsState _value, $Res Function(_$_TournamentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptanceList = null,
    Object? tournamentDataList = null,
    Object? loading = null,
  }) {
    return _then(_$_TournamentsState(
      acceptanceList: null == acceptanceList
          ? _value._acceptanceList
          : acceptanceList // ignore: cast_nullable_to_non_nullable
              as List<AcceptanceListData>,
      tournamentDataList: null == tournamentDataList
          ? _value._tournamentDataList
          : tournamentDataList // ignore: cast_nullable_to_non_nullable
              as List<TournamentData>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TournamentsState implements _TournamentsState {
  const _$_TournamentsState(
      {final List<AcceptanceListData> acceptanceList = const [],
      final List<TournamentData> tournamentDataList = const [],
      this.loading = false})
      : _acceptanceList = acceptanceList,
        _tournamentDataList = tournamentDataList;

  final List<AcceptanceListData> _acceptanceList;
  @override
  @JsonKey()
  List<AcceptanceListData> get acceptanceList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_acceptanceList);
  }

  final List<TournamentData> _tournamentDataList;
  @override
  @JsonKey()
  List<TournamentData> get tournamentDataList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tournamentDataList);
  }

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'TournamentsState(acceptanceList: $acceptanceList, tournamentDataList: $tournamentDataList, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TournamentsState &&
            const DeepCollectionEquality()
                .equals(other._acceptanceList, _acceptanceList) &&
            const DeepCollectionEquality()
                .equals(other._tournamentDataList, _tournamentDataList) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_acceptanceList),
      const DeepCollectionEquality().hash(_tournamentDataList),
      loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TournamentsStateCopyWith<_$_TournamentsState> get copyWith =>
      __$$_TournamentsStateCopyWithImpl<_$_TournamentsState>(this, _$identity);
}

abstract class _TournamentsState implements TournamentsState {
  const factory _TournamentsState(
      {final List<AcceptanceListData> acceptanceList,
      final List<TournamentData> tournamentDataList,
      final bool loading}) = _$_TournamentsState;

  @override
  List<AcceptanceListData> get acceptanceList;
  @override
  List<TournamentData> get tournamentDataList;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$_TournamentsStateCopyWith<_$_TournamentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
