import 'package:flutter/cupertino.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';

import '../constants/constants.dart';

class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? fontColor;
  final String text;
  final VoidCallback onTap;
  final bool canClick;
  final double? width;
  final double radius;
  final double? textSize;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxBorder? border;

  const CustomButton({
    this.text = Constants.empty,
    this.radius = Sizes.dimen_8,
    required this.onTap,
    this.backgroundColor = AppColor.backgroundLight,
    this.fontColor = AppColor.primary,
    this.width = double.infinity,
    this.textSize = Sizes.dimen_15,
    this.height = Sizes.dimen_48,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.border,
    this.canClick = true,
  }) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        border: border,
      ),
      child: CupertinoButton(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        onPressed: canClick ? onTap : null,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        child: Text(
          text,
          style: AppTextStyle.bold14.copyWith(
            color: fontColor,
            fontSize: textSize,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
