import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:junior_tennis_organizer/routes/app_routes.dart';
import 'package:junior_tennis_organizer/routes/navigation_route.dart';

part 'main_state.dart';

part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  final NavigationRoute _navigationRoute;

  MainCubit(this._navigationRoute, {int index = 1}) : super(MainState(index: index));

  void changeTab(int index) {
    if(index!=1) {
      print("CHANGETAB");
      emit(state.copyWith(index: index));
    }
  }
  void changeToMain() {
    print("OKAY");
      emit(state.copyWith(index: 1));
  }

}
