import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junior_tennis_organizer/ui/main/home/widgets/ranking_tab_item_widget.dart';

import '../../../../core/theme/theme.dart';

class HomeRankingTabsWidget extends StatefulWidget {
  const HomeRankingTabsWidget({Key? key}) : super(key: key);

  @override
  State<HomeRankingTabsWidget> createState() => _HomeRankingTabsWidgetState();
}

class _HomeRankingTabsWidgetState extends State<HomeRankingTabsWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          onTap: (index) {
            tabController.animateTo(index);
            setState(() {});
            // widget.getIndex(index);
          },
          isScrollable: true,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          padding: const EdgeInsets.only(bottom: Sizes.dimen_16),
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor: AppColor.text1,
          labelStyle: AppTextStyle.semiBold14,
          unselectedLabelStyle: AppTextStyle.semiBold14,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AppColor.text1,
          indicatorPadding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          tabs: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_12, horizontal: Sizes.dimen_16),
              decoration: BoxDecoration(
                color: tabController.index == 0 ? AppColor.primary : AppColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Sizes.dimen_8),
                  bottomLeft: Radius.circular(Sizes.dimen_8),
                ),
                border: Border.all(color: AppColor.grey, width: Sizes.dimen_1),
                boxShadow: const [
                  BoxShadow(
                      color: AppColor.grey,
                      offset: Offset(Sizes.dimen_1, Sizes.dimen_0),
                      blurRadius: Sizes.dimen_0,
                      spreadRadius: Sizes.dimen_0)
                ],
              ),
              child: const Text("ITF ranking"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_12, horizontal: Sizes.dimen_16),
              decoration: BoxDecoration(
                  color: tabController.index == 1 ? AppColor.primary : AppColor.white,
                  boxShadow: AppShadow.rankingShadow,
                  border: const Border.symmetric(
                      horizontal: BorderSide(color: AppColor.grey, width: Sizes.dimen_1))),
              child: const Text("ATF ranking"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_12, horizontal: Sizes.dimen_16),
              decoration: BoxDecoration(
                color: tabController.index == 2 ? AppColor.primary : AppColor.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(Sizes.dimen_8),
                  bottomRight: Radius.circular(Sizes.dimen_8),
                ),
                border: Border.all(color: AppColor.grey, width: Sizes.dimen_1),
                boxShadow: AppShadow.rankingShadow,
              ),
              child: const Text("TE ranking"),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      /// Place Card
                      HomeRankingTabsItemWidget(
                        padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_12, vertical: Sizes.dimen_8),
                        color: AppColor.lightGreen,
                        leading: Column(
                          children: [
                            Text(
                              '25',
                              style: AppTextStyle.semiBold16.copyWith(color: AppColor.green),
                            ),
                            Text(
                              'place',
                              style: AppTextStyle.regular12.copyWith(color: AppColor.green),
                            )
                          ],
                        ),
                        title: '+50',
                        isGreen: true,
                        subtitle: '1,550 pts',
                      ),
                     const SizedBox(width: Sizes.dimen_16),

                      /// Last week
                      HomeRankingTabsItemWidget(
                        leading: SvgPicture.asset(AppSvg.calendarMid),
                        title: 'Last week',
                        subtitle: '1,500 pts',
                        padding: const EdgeInsets.all(Sizes.dimen_16),
                        color: AppColor.lightBlue,
                      ),
                    ],
                  ),
    const SizedBox(height: Sizes.dimen_16),
                  Row(
                    children: [
                      /// Events played
                      HomeRankingTabsItemWidget(
                        leading: SvgPicture.asset(AppSvg.badge),
                        title: 'Events played',
                        subtitle: '28',
                        padding: const EdgeInsets.all(Sizes.dimen_16),
                        color: AppColor.lightOrange,
                      ),

    const SizedBox(width: Sizes.dimen_16),
                      /// High Ranking
                      HomeRankingTabsItemWidget(
                        leading: SvgPicture.asset(
                          AppSvg.dashboardLine,
                          height: 24,
                          color: AppColor.purple,
                        ),
                        title: 'Career high rankings',
                        subtitle: '1,500 pts',
                        padding: const EdgeInsets.all(Sizes.dimen_16),
                        color: AppColor.lightPurple,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      /// Place Card
                      HomeRankingTabsItemWidget(
                        padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_12, vertical: Sizes.dimen_8),
                        color: AppColor.lightGreen,
                        leading: Column(
                          children: [
                            Text(
                              '25',
                              style: AppTextStyle.semiBold16.copyWith(color: AppColor.green),
                            ),
                            Text(
                              'place',
                              style: AppTextStyle.regular12.copyWith(color: AppColor.green),
                            )
                          ],
                        ),
                        title: '+50',
                        subtitle: '1,550 pts',
                      ),
                      const SizedBox(width: Sizes.dimen_16),

                      /// Last week
                      HomeRankingTabsItemWidget(
                        leading: SvgPicture.asset(AppSvg.calendarMid),
                        title: 'Last week',
                        subtitle: '1,500 pts',
                        padding: const EdgeInsets.all(Sizes.dimen_16),
                        color: AppColor.lightBlue,
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.dimen_16),

                  Row(
                    children: [
                      /// Events played
                      HomeRankingTabsItemWidget(
                        leading: SvgPicture.asset(AppSvg.badge),
                        title: 'Events played',
                        subtitle: '28',
                        padding: const EdgeInsets.all(Sizes.dimen_16),
                        color: AppColor.lightOrange,
                      ),

                      const SizedBox(width: Sizes.dimen_16),


                      /// High Ranking
                      HomeRankingTabsItemWidget(
                        leading: SvgPicture.asset(
                          AppSvg.dashboardLine,
                          height: 24,
                          color: AppColor.purple,
                        ),
                        title: 'Career high rankings',
                        subtitle: '1,500 pts',
                        padding: const EdgeInsets.all(Sizes.dimen_16),
                        color: AppColor.lightPurple,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      /// Place Card
                      HomeRankingTabsItemWidget(
                        padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_12, vertical: Sizes.dimen_8),
                        color: AppColor.lightGreen,
                        leading: Column(
                          children: [
                            Text(
                              '25',
                              style: AppTextStyle.semiBold16.copyWith(color: AppColor.green),
                            ),
                            Text(
                              'place',
                              style: AppTextStyle.regular12.copyWith(color: AppColor.green),
                            )
                          ],
                        ),
                        title: '+50',
                        subtitle: '1,550 pts',
                      ),
                      const SizedBox(width: Sizes.dimen_16),


                      /// Last week
                      HomeRankingTabsItemWidget(
                        leading: SvgPicture.asset(AppSvg.calendarMid),
                        title: 'Last week',
                        subtitle: '1,500 pts',
                        padding: const EdgeInsets.all(Sizes.dimen_16),
                        color: AppColor.lightBlue,
                      ),
                    ],
                  ),
                  const SizedBox(height: Sizes.dimen_16),
                  Row(
                    children: [
                      /// Events played
                      HomeRankingTabsItemWidget(
                        leading: SvgPicture.asset(AppSvg.badge),
                        title: 'Events played',
                        subtitle: '28',
                        padding: const EdgeInsets.all(Sizes.dimen_16),
                        color: AppColor.lightOrange,
                      ),

                      const SizedBox(width: Sizes.dimen_16),

                      /// High Ranking
                      HomeRankingTabsItemWidget(
                        leading: SvgPicture.asset(
                          AppSvg.dashboardLine,
                          height: 24,
                          color: AppColor.purple,
                        ),
                        title: 'Career high rankings',
                        subtitle: '1,500 pts',
                        padding: const EdgeInsets.all(Sizes.dimen_16),
                        color: AppColor.lightPurple,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
