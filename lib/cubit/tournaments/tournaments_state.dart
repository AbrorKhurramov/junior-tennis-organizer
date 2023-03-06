part of 'tournaments_cubit.dart';

@freezed
class TournamentsState with _$TournamentsState {
  const factory TournamentsState({
    @Default([]) List<AcceptanceListData> acceptanceList,
    @Default([]) List<TournamentData> tournamentDataList,
    @Default(false) bool loading,
  }) = _TournamentsState;
}
