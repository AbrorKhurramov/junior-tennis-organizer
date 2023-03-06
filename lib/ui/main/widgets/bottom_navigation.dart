import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key, required this.index, required this.onTap}) : super(key: key);

  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColor.grey, width: Sizes.dimen_1_5)),
        color: AppColor.white,
      ),
      child: BottomNavigationBar(
        backgroundColor: AppColor.transparent,
        currentIndex: index,
        onTap: onTap,
        elevation: Sizes.dimen_0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle:
        AppTextStyle.regular12.copyWith(fontSize: Sizes.dimen_10, color: AppColor.grey),
        selectedLabelStyle:
        AppTextStyle.regular12.copyWith(fontSize: Sizes.dimen_10, color: AppColor.text1),
        unselectedFontSize: Sizes.dimen_10,
        selectedFontSize: Sizes.dimen_10,
        selectedItemColor: AppColor.black,
        unselectedItemColor: AppColor.black.withOpacity(Sizes.dimen_0_5),
        items: <BottomNavigationBarItem>[
          _buildMenuItem(
            iconPath: AppSvg.tournamentLine,
            secondPath: AppSvg.tournament,
            title: "Tournaments",
          ),
          _buildEmptyMenuItem(),

          _buildMenuItem(
            iconPath: AppSvg.rankingLine,
            secondPath: AppSvg.ranking,
            title: "Rankings",
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildMenuItem({
    required String iconPath,
    required String secondPath,
    required String title,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding:const EdgeInsets.only(bottom: Sizes.dimen_2),
        child: SvgPicture.asset(
           iconPath,
          height: Sizes.dimen_32,
          width: Sizes.dimen_32,
        ),
      ),
      activeIcon: Padding(
        padding:const EdgeInsets.only(bottom: Sizes.dimen_2),
        child: SvgPicture.asset(
          secondPath,
          height: Sizes.dimen_32,
          width: Sizes.dimen_32,
        ),
      ),
      label: title,
      backgroundColor: AppColor.transparent,
      tooltip: null,
    );
  }
  BottomNavigationBarItem _buildEmptyMenuItem() {
    return const BottomNavigationBarItem(icon: SizedBox(), label: '');
  }
}
