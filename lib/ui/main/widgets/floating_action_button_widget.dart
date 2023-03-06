import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/theme.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final int pageIndex;

  const FloatingActionButtonWidget({Key? key, required this.onTap, required this.pageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Sizes.dimen_18),
        decoration: BoxDecoration(
          color: pageIndex == 1 ? AppColor.black : AppColor.white,
          border: Border.all(color: AppColor.grey),
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(
          pageIndex == 1 ? AppSvg.dashboard : AppSvg.dashboardLine,
        ),
      ),
    );
  }
}
