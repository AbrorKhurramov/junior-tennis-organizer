import 'package:flutter/material.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';

import '../../../../data/model/home/followings_data.dart';
import 'calendar_widget.dart';
import 'followings_widget.dart';

class HomeBottomSheetWidget extends StatefulWidget {
   HomeBottomSheetWidget({Key? key,required this.followingData}) : super(key: key);
List<FollowingsData> followingData;
  @override
  State<HomeBottomSheetWidget> createState() => _HomeBottomSheetWidgetState();
}

class _HomeBottomSheetWidgetState extends State<HomeBottomSheetWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.7,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                offset: const Offset(0, -3),
                blurRadius: 10,
                spreadRadius: 0,
              )
            ],
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(Sizes.dimen_30),
              topLeft: Radius.circular(Sizes.dimen_30),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                TabBar(
                  controller: tabController,
                  onTap: (index) {
                    tabController.animateTo(index);
                    setState(() {});
                  },
                  isScrollable: true,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24, vertical: Sizes.dimen_16),
                  unselectedLabelColor: AppColor.text5,
                  labelStyle: AppTextStyle.bold24,
                  unselectedLabelStyle: AppTextStyle.bold24,
                  labelColor: AppColor.text1,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorColor: Colors.transparent,
                  tabs: const [
                    Text("Calendar"),
                    Text("Followings"),
                  ],
                ),
                tabController.index == 0
                    ? const CalendarWidget()
                    :  FollowingsWidget(followingsData: widget.followingData),
              ],
            ),
          ),
        );
      },
    );
  }
}
