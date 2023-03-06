part of 'rankings_cubit.dart';

@freezed
class RankingsState with _$RankingsState {
  const factory RankingsState({
    @Default([]) List<List<RankingData>> list,
    @Default(false) bool loading,
  }) = _RankingsState;
}
