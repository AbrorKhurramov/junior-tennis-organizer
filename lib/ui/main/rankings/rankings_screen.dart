import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junior_tennis_organizer/core/custom_widgets/modal_progress_hud.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';
import 'package:junior_tennis_organizer/cubit/rankings/rankings_cubit.dart';
import 'package:junior_tennis_organizer/di/get_it.dart';

import '../../../core/custom_widgets/custom_app_bar.dart';
import '../../../core/custom_widgets/custom_text_field.dart';
import 'widgets/ranking_tabs_widget.dart';
import 'widgets/tab_bar_view_item_widget.dart';

class RankingsScreen extends StatefulWidget {
  const RankingsScreen({Key? key}) : super(key: key);

  @override
  State<RankingsScreen> createState() => _RankingsScreenState();
}

class _RankingsScreenState extends State<RankingsScreen> with SingleTickerProviderStateMixin{
  late final RankingsCubit _rankingsCubit;
  late TabController tabController;

  @override
  void initState() {
    _rankingsCubit = getItInstance<RankingsCubit>();
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    _rankingsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RankingsCubit>.value(value: _rankingsCubit),
      ],
      child: BlocBuilder<RankingsCubit, RankingsState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: customAppBar(
              leading: const SizedBox.shrink(),
              context: context,
              title: 'Rankings',
              centerTitle: true,
            ),
            body: ModalProgressHUD(
              inAsyncCall: state.loading,
              child: Column(
                children: [
                  const SizedBox(height: Sizes.dimen_6),

                  /// Search
                  CustomTextField(
                    hintText: 'Search',
                    borderRadius: Sizes.dimen_18,
                    fillColor: AppColor.white,
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                    prefixIcon: SvgPicture.asset(AppSvg.search),
                  ),

                  const SizedBox(height: Sizes.dimen_16),

                  RankingTabsWidget(tabController: tabController),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(state.list.length, (index) => TabBarViewItem(rankingData: state.list[index])),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
