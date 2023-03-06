import 'dart:io';

import 'package:junior_tennis_organizer/core/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double size;

  const ProgressBar({
    Key? key,
    this.size = Sizes.dimen_32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Platform.isAndroid
          ? const CircularProgressIndicator(
              color: AppColor.primary,
              strokeWidth: Sizes.dimen_2,
            )
          : Theme(
              data: ThemeData(
                cupertinoOverrideTheme: const CupertinoThemeData(
                  primaryColor: AppColor.primary,
                ),
              ),
              child: CupertinoActivityIndicator(
                radius: size / Sizes.dimen_2,
                animating: true,
              ),
            ),
    );
  }
}
