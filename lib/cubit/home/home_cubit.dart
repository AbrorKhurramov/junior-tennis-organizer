import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:junior_tennis_organizer/data/model/home/followings_data.dart';

import '../../core/theme/theme.dart';
import '../../domain/repository/main_repository.dart';
import '../../routes/navigation_route.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final NavigationRoute _navigationRoute;
  final MainRepository _repository;

  HomeCubit(this._navigationRoute, this._repository): super(const HomeState()){
getData();
  }

  getData() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(AppDuration.duration3);
    emit(state.copyWith(
      loading: false,
      list: [
        FollowingsData(image: AppPng.profile, name: "Tatyana kim", flag: AppSvg.france),
        FollowingsData(image: AppPng.shoxrux, name: "Shohruh Qosimov", flag: AppSvg.usa),
        FollowingsData(image: AppPng.viktor, name: "Viktor Khegay", flag: AppSvg.southKorea),
        FollowingsData(image: AppPng.aleksandr, name: "Aleksandr Kashubin", flag: AppSvg.russia),
        FollowingsData(image: AppPng.said, name: "Saidmakhmud Sharipov", flag: AppSvg.uzbekistan),
      ],
    ));
  }


}