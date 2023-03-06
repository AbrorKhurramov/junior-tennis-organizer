import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';
import 'package:junior_tennis_organizer/cubit/home/home_cubit.dart';

import '../../../routes/app_routes.dart';
import 'widgets/home_bottom_sheet_widget.dart';
import 'widgets/ranking_tabs_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: Sizes.paddingHorizontal16,
            child: Column(
              children: [
                const SizedBox(height: Sizes.dimen_24),
                /// ListTile
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: Sizes.dimen_50,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.dimen_96),
                    child: Container(
                      height: Sizes.dimen_56,
                      width: Sizes.dimen_56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.dimen_96),
                      ),
                      child:
                          Image.asset(AppPng.userImage)
                    ),
                  ),
                  title: const Text('Tatyana Kim', style: AppTextStyle.bold24),
                  subtitle: Row(
                    children: [
                      Text(
                        '2003 (18 y.o.) from  ',
                        style: AppTextStyle.regular12.copyWith(color: AppColor.text3),
                      ),
                      SvgPicture.asset(AppSvg.germany),
                      Text(
                        ' Uzbekistan',
                        style: AppTextStyle.regular12.copyWith(color: AppColor.text3),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.settings);
                    },
                    child: SvgPicture.asset(AppSvg.setting),
                  ),
                ),

                const SizedBox(height: Sizes.dimen_24),

                 SizedBox(
                  height: MediaQuery.of(context).size.height/2,
                  child: const HomeRankingTabsWidget(),
                ),
              ],
            ),
          ),
           HomeBottomSheetWidget(followingData: state.list),
        ],
      ),
    );
  },
);
  }
}
