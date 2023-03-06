import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class RankingTabsWidget extends StatefulWidget {
  final TabController tabController;

  const RankingTabsWidget({Key? key, required this.tabController})
      : super(key: key);

  @override
  State<RankingTabsWidget> createState() => _RankingTabsWidgetState();
}

class _RankingTabsWidgetState extends State<RankingTabsWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: widget.tabController,
          onTap: (index) {
            widget.tabController.animateTo(index);
            setState(() {});
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
              padding: const EdgeInsets.symmetric(vertical:Sizes.dimen_12, horizontal: Sizes.dimen_16),
              decoration: BoxDecoration(
                color: widget.tabController.index == 0 ? AppColor.primary : AppColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Sizes.dimen_8),
                  bottomLeft: Radius.circular(Sizes.dimen_8),
                ),
                border: Border.all(color: AppColor.grey, width: 1),
                boxShadow: const [
                  BoxShadow(
                      color: AppColor.grey,
                      offset: Offset(1, 0),
                      blurRadius: 0,
                      spreadRadius: 0)
                ],
              ),
              child: const Text("ITF ranking"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_12, horizontal: Sizes.dimen_16),
              decoration: BoxDecoration(
                  color: widget.tabController.index == 1 ? AppColor.primary : AppColor.white,
                  boxShadow: const [
                    BoxShadow(
                        color: AppColor.grey,
                        offset: Offset(1, 0),
                        blurRadius: 0,
                        spreadRadius: 0)
                  ],
                  border: const Border.symmetric(
                      horizontal: BorderSide(color: AppColor.grey, width: 1))),
              child: const Text("ATF ranking"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_12, horizontal: Sizes.dimen_16),
              decoration: BoxDecoration(
                color: widget.tabController.index == 2 ? AppColor.primary : AppColor.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(Sizes.dimen_8),
                  bottomRight: Radius.circular(Sizes.dimen_8),
                ),
                border: Border.all(color: AppColor.grey, width: 1),
                boxShadow: const [
                  BoxShadow(
                      color: AppColor.grey,
                      offset: Offset(1, 0),
                      blurRadius: 0,
                      spreadRadius: 0)
                ],
              ),
              child: const Text("TE ranking"),
            ),
          ],
        ),

      ],
    );
  }
}
