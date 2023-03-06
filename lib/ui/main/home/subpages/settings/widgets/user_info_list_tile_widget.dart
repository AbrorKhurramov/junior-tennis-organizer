import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';

class UserInfoListTileWidget extends StatelessWidget {
  final String title;
  final String icon;

  const UserInfoListTileWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:Sizes.dimen_20),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: AppColor.red,
          ),
          const SizedBox(width: Sizes.dimen_16),
          Text(
            title,
            style: AppTextStyle.semiBold16,
          )
        ],
      ),
    );
  }
}
