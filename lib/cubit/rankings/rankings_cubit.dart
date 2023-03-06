import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:junior_tennis_organizer/data/model/ranking/ranking_item_data.dart';

import '../../core/theme/app_duration.dart';
import '../../core/theme/theme.dart';
import '../../data/model/ranking/ranking_data.dart';
import '../../domain/repository/main_repository.dart';
import '../../routes/navigation_route.dart';

part 'rankings_state.dart';

part 'rankings_cubit.freezed.dart';

class RankingsCubit extends Cubit<RankingsState> {
  final NavigationRoute _navigationRoute;
  final MainRepository _repository;




  RankingsCubit(this._navigationRoute, this._repository): super(const RankingsState()){
    getData();
  }


  getData() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(AppDuration.duration3);
    emit(state.copyWith(
      loading: false,
      list: [
      //1
        [
        RankingData(rankingName: "Girls", rankingItemData: [
          RankingItemData(
            playerName: "Tatyana Kim",
            flag:AppSvg.france,
            year: 2003,
            points: "2,889",
            totalPoints: "2,889"
        ),
          RankingItemData(
            playerName: "Victoria Jimenez Kas…",
            flag:AppSvg.usa,
            year: 2004,
            points: "2,578",
            totalPoints: "2,578"
        ),
          RankingItemData(
            playerName: "Shohida Ravshanova",
            flag:AppSvg.uzbekistan,
            year: 2003,
            points: "2,257",
            totalPoints: "2,257"
        ),
          RankingItemData(
            playerName: "Valeriya Kalugina",
            flag:AppSvg.russia,
            year: 2003,
            points: "1,936",
            totalPoints: "1,936"
        ), RankingItemData(
            playerName: "Aleksandra Daddario",
            flag:AppSvg.greatBritain,
            year: 2004,
            points: "1,605",
            totalPoints: "1,605"
        ),
          RankingItemData(
            playerName: "Sayyora Karimova",
            flag:AppSvg.kazahstan,
            year: 2003,
            points: "1,505",
            totalPoints: "1,505"
        ),

        ]
        ),
      RankingData(rankingName: "Boys", rankingItemData: [
          RankingItemData(
            playerName: "Ravshan Ibragimov",
            flag:AppSvg.greatBritain,
            year: 2003,
            points: "2,889",
            totalPoints: "2,889"
        ),
          RankingItemData(
            playerName: "Shohruh Qosimov",
            flag:AppSvg.canada,
            year: 2004,
            points: "2,578",
            totalPoints: "2,578"
        ),
          RankingItemData(
            playerName: "Abduvokhid Akhmedov",
            flag:AppSvg.australia,
            year: 2003,
            points: "2,257",
            totalPoints: "2,257"
        ),
          RankingItemData(
            playerName: "Viktor Khegay",
            flag:AppSvg.southKorea,
            year: 2003,
            points: "1,936",
            totalPoints: "1,936"
        ), RankingItemData(
            playerName: "Aleksandr Kashubin",
            flag:AppSvg.russia,
            year: 2004,
            points: "1,605",
            totalPoints: "1,605"
        ),
          RankingItemData(
            playerName: "Saidmakhmud Sharipov",
            flag:AppSvg.malaysia,
            year: 2003,
            points: "1,505",
            totalPoints: "1,505"
        ),

        ]
        ),

        ],
        //2
        [
        RankingData(rankingName: "Girls U14", rankingItemData: [
          RankingItemData(
            playerName: "Tatyana Kim",
            flag:AppSvg.france,
            year: 2003,
            points: "2,889",
            totalPoints: "2,889"
        ),
          RankingItemData(
            playerName: "Victoria Jimenez Kas…",
            flag:AppSvg.usa,
            year: 2004,
            points: "2,578",
            totalPoints: "2,578"
        ),
          RankingItemData(
            playerName: "Shohida Ravshanova",
            flag:AppSvg.uzbekistan,
            year: 2003,
            points: "2,257",
            totalPoints: "2,257"
        ),
          RankingItemData(
            playerName: "Valeriya Kalugina",
            flag:AppSvg.russia,
            year: 2003,
            points: "1,936",
            totalPoints: "1,936"
        ), RankingItemData(
            playerName: "Aleksandra Daddario",
            flag:AppSvg.greatBritain,
            year: 2004,
            points: "1,605",
            totalPoints: "1,605"
        ),
          RankingItemData(
            playerName: "Sayyora Karimova",
            flag:AppSvg.kazahstan,
            year: 2003,
            points: "1,505",
            totalPoints: "1,505"
        ),

        ]
        ),
      RankingData(rankingName: "Boys U14", rankingItemData: [
          RankingItemData(
            playerName: "Ravshan Ibragimov",
            flag:AppSvg.greatBritain,
            year: 2003,
            points: "2,889",
            totalPoints: "2,889"
        ),
          RankingItemData(
            playerName: "Shohruh Qosimov",
            flag:AppSvg.canada,
            year: 2004,
            points: "2,578",
            totalPoints: "2,578"
        ),
          RankingItemData(
            playerName: "Abduvokhid Akhmedov",
            flag:AppSvg.australia,
            year: 2003,
            points: "2,257",
            totalPoints: "2,257"
        ),
          RankingItemData(
            playerName: "Viktor Khegay",
            flag:AppSvg.southKorea,
            year: 2003,
            points: "1,936",
            totalPoints: "1,936"
        ), RankingItemData(
            playerName: "Aleksandr Kashubin",
            flag:AppSvg.russia,
            year: 2004,
            points: "1,605",
            totalPoints: "1,605"
        ),
          RankingItemData(
            playerName: "Saidmakhmud Sharipov",
            flag:AppSvg.malaysia,
            year: 2003,
            points: "1,505",
            totalPoints: "1,505"
        ),

        ]
        ),

        ],
        //3
        [
        RankingData(rankingName: "Girls", rankingItemData: [
          RankingItemData(
            playerName: "Tatyana Kim",
            flag:AppSvg.france,
            year: 2003,
            points: "2,889",
            totalPoints: "2,889"
        ),
          RankingItemData(
            playerName: "Victoria Jimenez Kas…",
            flag:AppSvg.usa,
            year: 2004,
            points: "2,578",
            totalPoints: "2,578"
        ),
          RankingItemData(
            playerName: "Shohida Ravshanova",
            flag:AppSvg.uzbekistan,
            year: 2003,
            points: "2,257",
            totalPoints: "2,257"
        ),
          RankingItemData(
            playerName: "Valeriya Kalugina",
            flag:AppSvg.russia,
            year: 2003,
            points: "1,936",
            totalPoints: "1,936"
        ), RankingItemData(
            playerName: "Aleksandra Daddario",
            flag:AppSvg.greatBritain,
            year: 2004,
            points: "1,605",
            totalPoints: "1,605"
        ),
          RankingItemData(
            playerName: "Sayyora Karimova",
            flag:AppSvg.kazahstan,
            year: 2003,
            points: "1,505",
            totalPoints: "1,505"
        ),

        ]
        ),
      RankingData(rankingName: "Boys", rankingItemData: [
          RankingItemData(
            playerName: "Ravshan Ibragimov",
            flag:AppSvg.greatBritain,
            year: 2003,
            points: "2,889",
            totalPoints: "2,889"
        ),
          RankingItemData(
            playerName: "Shohruh Qosimov",
            flag:AppSvg.canada,
            year: 2004,
            points: "2,578",
            totalPoints: "2,578"
        ),
          RankingItemData(
            playerName: "Abduvokhid Akhmedov",
            flag:AppSvg.australia,
            year: 2003,
            points: "2,257",
            totalPoints: "2,257"
        ),
          RankingItemData(
            playerName: "Viktor Khegay",
            flag:AppSvg.southKorea,
            year: 2003,
            points: "1,936",
            totalPoints: "1,936"
        ), RankingItemData(
            playerName: "Aleksandr Kashubin",
            flag:AppSvg.russia,
            year: 2004,
            points: "1,605",
            totalPoints: "1,605"
        ),
          RankingItemData(
            playerName: "Saidmakhmud Sharipov",
            flag:AppSvg.malaysia,
            year: 2003,
            points: "1,505",
            totalPoints: "1,505"
        ),

        ]
        ),
 RankingData(rankingName: "Girls U14", rankingItemData: [
          RankingItemData(
            playerName: "Tatyana Kim",
            flag:AppSvg.france,
            year: 2003,
            points: "2,889",
            totalPoints: "2,889"
        ),
          RankingItemData(
            playerName: "Victoria Jimenez Kas…",
            flag:AppSvg.usa,
            year: 2004,
            points: "2,578",
            totalPoints: "2,578"
        ),
          RankingItemData(
            playerName: "Shohida Ravshanova",
            flag:AppSvg.uzbekistan,
            year: 2003,
            points: "2,257",
            totalPoints: "2,257"
        ),
          RankingItemData(
            playerName: "Valeriya Kalugina",
            flag:AppSvg.russia,
            year: 2003,
            points: "1,936",
            totalPoints: "1,936"
        ), RankingItemData(
            playerName: "Aleksandra Daddario",
            flag:AppSvg.greatBritain,
            year: 2004,
            points: "1,605",
            totalPoints: "1,605"
        ),
          RankingItemData(
            playerName: "Sayyora Karimova",
            flag:AppSvg.kazahstan,
            year: 2003,
            points: "1,505",
            totalPoints: "1,505"
        ),

        ]
        ),
      RankingData(rankingName: "Boys U14", rankingItemData: [
          RankingItemData(
            playerName: "Ravshan Ibragimov",
            flag:AppSvg.greatBritain,
            year: 2003,
            points: "2,889",
            totalPoints: "2,889"
        ),
          RankingItemData(
            playerName: "Shohruh Qosimov",
            flag:AppSvg.canada,
            year: 2004,
            points: "2,578",
            totalPoints: "2,578"
        ),
          RankingItemData(
            playerName: "Abduvokhid Akhmedov",
            flag:AppSvg.australia,
            year: 2003,
            points: "2,257",
            totalPoints: "2,257"
        ),
          RankingItemData(
            playerName: "Viktor Khegay",
            flag:AppSvg.southKorea,
            year: 2003,
            points: "1,936",
            totalPoints: "1,936"
        ), RankingItemData(
            playerName: "Aleksandr Kashubin",
            flag:AppSvg.russia,
            year: 2004,
            points: "1,605",
            totalPoints: "1,605"
        ),
          RankingItemData(
            playerName: "Saidmakhmud Sharipov",
            flag:AppSvg.malaysia,
            year: 2003,
            points: "1,505",
            totalPoints: "1,505"
        ),

        ]
        ),

        ],

      ],
    ));
  }





}