
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:junior_tennis_organizer/core/custom_widgets/custom_app_bar.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';
import 'package:junior_tennis_organizer/ui/main/home/subpages/settings/widgets/user_info_list_tile_widget.dart';

import '../../../../../core/custom_widgets/custom_button.dart';
import '../../../../../cubit/settings/settings_cubit.dart';
import 'widgets/settings_menu_tile_widget.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Settings",
        context: context,
        centerTitle: true,
      ),
      body: BlocBuilder<SettingsCubit, ThemeData>(
        builder: (context, state) {
          return Column(
            children: [
              /// Header
              FadeInDown(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24, vertical: Sizes.dimen_12),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(Sizes.dimen_30),
                      ),
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.black.withOpacity(0.1),
                          offset: const Offset(0, 3),
                          blurRadius: 10,
                        )
                      ]),
                  child: Column(
                    children: [
                      /// Image and Name
                      Row(
                        children: [
                           ClipOval(
                            child: Image.asset(
                                AppPng.userImage,
                            )
                          ),
                          const SizedBox(width: Sizes.dimen_16),
                          Text(
                            'Tatyana Kim',
                            style: AppTextStyle.bold24.copyWith(fontSize: Sizes.dimen_30),
                          )
                        ],
                      ),
                      const SizedBox(height: Sizes.dimen_30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_36),
                        child: Column(
                          children: const[
                             UserInfoListTileWidget(
                              title: '12.03.2003 (18 y.o.)',
                              icon: AppSvg.calendarMid,
                            ),
                            UserInfoListTileWidget(
                              title: 'tatyana.kim@jto.com',
                              icon: AppSvg.email,
                            ),
                            UserInfoListTileWidget(
                              title: '+998 90 123 4567',
                              icon: AppSvg.phone,
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Sizes.dimen_30),
              SettingsMenuTileWidget(
                title: 'Change pinned player',
                border: Border.all(color: AppColor.grey),
                borderRadius: BorderRadius.circular(Sizes.dimen_16),
              ),
              const SizedBox(height: Sizes.dimen_30),
              SettingsMenuTileWidget(
                title: 'Privacy & Security',
                border: Border.all(color: AppColor.grey),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Sizes.dimen_16), topRight: Radius.circular(Sizes.dimen_16)),
              ),
              const SettingsMenuTileWidget(
                title: 'About JTO',
                border: Border(
                  right: BorderSide(color: AppColor.grey),
                  left: BorderSide(color: AppColor.grey),
                ),
                borderRadius: null,
              ),
              SettingsMenuTileWidget(
                title: 'Support',
                border: Border.all(color: AppColor.grey),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Sizes.dimen_16)),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: FadeInUp(
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.only(bottom: Sizes.dimen_32, right: Sizes.dimen_24, left: Sizes.dimen_24),
          child: CustomButton(
            onTap: () {},
            text: "Log out",
            padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_14),
            backgroundColor: AppColor.white,
            fontColor: AppColor.text1,
          ),
        ),
      ),
    );
  }
}
