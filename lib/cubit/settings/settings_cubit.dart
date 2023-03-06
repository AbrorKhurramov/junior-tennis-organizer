





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/app_theme.dart';

class SettingsCubit extends Cubit<ThemeData>{
SettingsCubit(): super(appThemeData);

void toggleTheme(){
  if(state == appThemeData){
    emit(ThemeData.dark());
  }
  else {
    emit(appThemeData);
  }
}

}