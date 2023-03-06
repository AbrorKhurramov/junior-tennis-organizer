import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:junior_tennis_organizer/routes/app_routes.dart';

import '../../routes/navigation_route.dart';

class IntroCubit extends Cubit {
  final NavigationRoute _navigationRoute;

  IntroCubit(this._navigationRoute) : super(null);



  void next() {
    _navigationRoute.clearNavigateTo(Routes.main);
  }
}