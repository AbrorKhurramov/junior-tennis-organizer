import 'package:flutter/material.dart';
import 'package:junior_tennis_organizer/ui/main/rankings/widgets/ranking_tab_item_widget.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/model/ranking/ranking_data.dart';

class TabBarViewItem extends StatefulWidget {
  const TabBarViewItem({Key? key,required this.rankingData}) : super(key: key);
final List<RankingData> rankingData;
  @override
  State<TabBarViewItem> createState() => _TabBarViewItemState();
}

class _TabBarViewItemState extends State<TabBarViewItem> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: widget.rankingData.length);
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
          },
          isScrollable: true,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          unselectedLabelColor: AppColor.text5,
          labelStyle: AppTextStyle.bold18,
          unselectedLabelStyle: AppTextStyle.bold18,
          labelColor: AppColor.text1,
          indicatorPadding: EdgeInsets.zero,
          indicatorColor: AppColor.primary,
          tabs: List.generate(widget.rankingData.length, (index) => Text(widget.rankingData[index].rankingName)),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: List.generate(widget.rankingData.length, (index) => RankingTabItemWidget(rankingItemData: widget.rankingData[index].rankingItemData)),
          ),
        ),
      ],
    );
  }
}
