import 'package:flutter/material.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';
class SettingsMenuTileWidget extends StatelessWidget {
  final String title;
  final Border border;
  final BorderRadius? borderRadius;

  const SettingsMenuTileWidget({
    Key? key,
    required this.title,
    required this.border,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.dimen_14),
      margin: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: borderRadius,
        border: border,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.semiBold16,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColor.red,
          ),
        ],
      ),
    );
  }
}
