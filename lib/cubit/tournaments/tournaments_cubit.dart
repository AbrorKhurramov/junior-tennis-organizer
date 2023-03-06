import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:junior_tennis_organizer/data/model/tournaments/tournament_data.dart';

import '../../core/theme/app_duration.dart';
import '../../core/theme/theme.dart';
import '../../data/model/tournaments/acceptance_list_data.dart';
import '../../domain/repository/main_repository.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigation_route.dart';

part 'tournaments_state.dart';

part 'tournaments_cubit.freezed.dart';

class TournamentsCubit extends Cubit<TournamentsState> {
  final NavigationRoute _navigationRoute;
  final MainRepository _repository;

  TournamentsCubit(this._navigationRoute, this._repository): super(const TournamentsState()){
    getAcceptanceData();
    getTournamentData();
  }

  getAcceptanceData() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(AppDuration.duration1);
    emit(state.copyWith(
      loading: false,
      acceptanceList: [
        AcceptanceListData(
            playerName: "Tatyana Kim",
            flag:AppSvg.france,
            eventsPlayed: 10,
            year: 2005,
            points: "1,345",
            totalPoints: "1,345"
        ),
         AcceptanceListData(
            playerName: "Shohruh Qosimov",
            flag:AppSvg.usa,
            eventsPlayed: 8,
            year: 2002,
            points: "1,345",
            totalPoints: "1,345"
        ),
         AcceptanceListData(
            playerName: "Viktor Khegay",
            flag:AppSvg.southKorea,
            eventsPlayed: 15,
            year: 2000,
            points: "1,345",
            totalPoints: "1,345"
        ),
         AcceptanceListData(
            playerName: "Aleksandr Kashubin",
            flag:AppSvg.russia,
            eventsPlayed: 12,
            year: 2004,
            points: "1,345",
            totalPoints: "1,345"
        ),
         AcceptanceListData(
            playerName: "Saidmakhmud Sharipov",
            flag:AppSvg.uzbekistan,
            eventsPlayed: 9,
            year: 2003,
            points: "1,345",
            totalPoints: "1,345"
        ),

      ],
    ));
  }
  getTournamentData() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(AppDuration.duration1);
    emit(state.copyWith(
      loading: false,
      tournamentDataList: [
     TournamentData(month: "Dec", day: "8", city: "Bolton",flag:AppSvg.greatBritain, hostNation: "Great Britain", title: "Junior International Bolton", tournamentDays: "Nov 25-Dec 5, 2021", type: "ITF", category: 1, ageGroup: "10-14 y.o."),
     TournamentData(month: "Dec", day: "12", city: "Tashkent",flag:AppSvg.uzbekistan, hostNation: "Uzbekistan", title: "XGLOsive Night Tennis", tournamentDays: "Nov 25-Dec 5, 2021", type: "ORANGE BOWL", category: 1, ageGroup: "14&U"),
     TournamentData(month: "Jan", day: "14", city: "Moscow",flag:AppSvg.russia, hostNation: "Russia", title: "Kremlin Cup Junior 2022", tournamentDays: "Nov 25-Dec 5, 2021", type: "TE", category: 1, ageGroup: "10-14 y.o."),
     TournamentData(month: "Nov", day: "27", city: "Berlin",flag:AppSvg.germany, hostNation: "Germany", title: "Tournament title long", tournamentDays: "Nov 25-Dec 5, 2021", type: "ITF", category: 1, ageGroup: "10-14 y.o."),
     TournamentData(month: "Dec", day: "4", city: "Miami",flag:AppSvg.usa, hostNation: "USA", title: "Tournament title long", tournamentDays: "Nov 25-Dec 5, 2021", type: "TE", category: 1, ageGroup: "10-14 y.o."),
     TournamentData(month: "Dec", day: "9", city: "Seoul",flag:AppSvg.southKorea, hostNation: "South Korea", title: "Tournament title long", tournamentDays: "Nov 25-Dec 5, 2021", type: "ATF", category: 1, ageGroup: "10-14 y.o."),
     TournamentData(month: "Dec", day: "13", city: "Paris",flag:AppSvg.france, hostNation: "France", title: "Tournament title long", tournamentDays: "Nov 25-Dec 5, 2021", type: "ORANGE BOWL", category: 1, ageGroup: "10-14 y.o."),
     TournamentData(month: "Jan", day: "5", city: "Ottawa",flag:AppSvg.canada, hostNation: "Canada", title: "Tournament title long", tournamentDays: "Nov 25-Dec 5, 2021", type: "ITF", category: 1, ageGroup: "10-14 y.o."),
      ],
    ));
  }
goToTournamentDetail(int index){
    _navigationRoute.navigateTo(Routes.tournamentDetail,arguments: state.tournamentDataList[index]);
}


  static const List<String> leagueData = [
"Wimbledon","Australian Open","US Open","French Open","Roland Garros"];

static const List<String> categoryData = [
"ATP","WTA","Singles","Doubles","Mixed"];
static const List<String> nationData = [
"USA","Great Britain","France","Australia","Spain"];
static const List<String> status = [
"confirmed","in process","cancelled","new"];


}