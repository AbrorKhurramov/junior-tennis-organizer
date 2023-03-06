import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:junior_tennis_organizer/ui/main/tournaments/tournaments_screen.dart';
import 'package:junior_tennis_organizer/ui/main/home/home_screen.dart';
import 'package:junior_tennis_organizer/ui/main/rankings/rankings_screen.dart';
import 'package:junior_tennis_organizer/ui/main/widgets/bottom_navigation.dart';
import '../../cubit/main/main_cubit.dart';
import 'widgets/floating_action_button_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (mainContext, state) {
        final cubit = mainContext.read<MainCubit>();
        return WillPopScope(
          onWillPop: () async {
            exit(0);
          },
          child: Scaffold(
            body: IndexedStack(
              index: state.index,
              children: const [
                TournamentsScreen(),
                HomeScreen(),
                RankingsScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigation(
              index: state.index,
              onTap: cubit.changeTab,
            ),
            floatingActionButton: FloatingActionButtonWidget(
              onTap: cubit.changeToMain,
              pageIndex: state.index,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}
