import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junior_tennis_organizer/core/theme/size_constants.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: AppColor.primary,
  appBarTheme: const AppBarTheme(
    elevation: Sizes.dimen_24,
    centerTitle: true,
    toolbarHeight: Sizes.dimen_56,
    backgroundColor: AppColor.backgroundLight,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColor.backgroundLight,
  backgroundColor: AppColor.backgroundLight,
  dialogBackgroundColor: AppColor.primary,
  fontFamily: AppTextStyle.font,
);
