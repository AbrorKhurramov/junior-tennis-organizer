import 'package:flutter/material.dart';
import 'package:junior_tennis_organizer/core/theme/app_colors.dart';

class AppShadow {
  AppShadow._();

  static const shadow1 = [
    BoxShadow(
      color: AppColor.black,
      offset: Offset(0, 0),
      blurRadius: 8,
    )
  ];
  static const rankingShadow =[
    BoxShadow(
        color: AppColor.grey,
        offset: Offset(1, 0),
        blurRadius: 0,
        spreadRadius: 0)
  ];
}
