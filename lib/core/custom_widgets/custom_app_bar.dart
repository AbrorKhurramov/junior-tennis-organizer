import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';
import '../theme/theme.dart';

PreferredSize customAppBar({
  String? title,
  Widget? titleWidget,
  PreferredSizeWidget? bottom,
  Widget? leading,
  double? leadingWidth,
  Color? color,
  bool? centerTitle,
  required BuildContext context,
  Function? titleTap,
  List<Widget>? actions,
  double toolbarHeight = kToolbarHeight,
  SystemUiOverlayStyle? systemOverlayStyle,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: SizedBox(
      height: toolbarHeight == 0? 0: null,
      child: AppBar(
        toolbarHeight: toolbarHeight,
        leadingWidth: leadingWidth,
        backgroundColor: color?? AppColor.white,
        elevation: Sizes.dimen_0,
        systemOverlayStyle: systemOverlayStyle ??
            const SystemUiOverlayStyle(statusBarColor: AppColor.backgroundLight, statusBarIconBrightness: Brightness.light),
        title: InkWell(
          onTap: () {
            titleTap?.call();
          },
          splashColor: AppColor.transparent,
          highlightColor: AppColor.transparent,
          child: titleWidget ??
              Text(
                title ?? Constants.empty,
                style: AppTextStyle.bold18,
              ),
        ),
       // backgroundColor: color ?? AppColor.background,
        leading: leading ??
            Padding(
              padding: const EdgeInsets.all(
                Sizes.dimen_8,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                splashColor: AppColor.transparent,
                borderRadius: BorderRadius.circular(
                  Sizes.dimen_8,
                ),
                child: Ink(
                  padding: const EdgeInsets.all(
                    Sizes.dimen_8,
                  ),
                  child: SvgPicture.asset(
                    AppSvg.back,
                    width: Sizes.dimen_24,
                    height: Sizes.dimen_24,
                  ),
                ),
              ),
            ),
        bottom: bottom,
        centerTitle: centerTitle,
        actions: actions,
      ),
    ),
  );
}
