part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<FollowingsData> list,
    @Default(false) bool loading,
  }) = _HomeState;
}
