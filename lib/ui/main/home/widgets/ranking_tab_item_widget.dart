import 'package:flutter/material.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';

class HomeRankingTabsItemWidget extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final EdgeInsets padding;
  final Color color;
  final bool? isGreen;

  const HomeRankingTabsItemWidget({
    Key? key,
    this.isGreen,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.padding,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(Sizes.dimen_12),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(Sizes.dimen_16),
          boxShadow: [
            BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                offset: const Offset(0, 3),
                blurRadius: 10,
                spreadRadius: 0)
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: padding,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(Sizes.dimen_96),
              ),
              child: leading,
            ),
            const SizedBox(width: Sizes.dimen_12),

            /// High Ranking
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.regular12.copyWith(color:isGreen==true?AppColor.green:AppColor.text5),
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyle.semiBold16,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
