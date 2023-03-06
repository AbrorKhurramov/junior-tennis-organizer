import 'package:flutter/material.dart';
import 'package:junior_tennis_organizer/ui/main/tournaments/subpages/tournament_detail/widgets/acceptance_list_tab_widget.dart';
import 'package:junior_tennis_organizer/ui/main/tournaments/subpages/tournament_detail/widgets/general_tab_widget.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../../../data/model/tournaments/acceptance_list_data.dart';


class TournamentDetailBottomSheetWidget extends StatefulWidget {
  final Function(int index) getIndex;
final List<AcceptanceListData> acceptanceData;
  const TournamentDetailBottomSheetWidget({Key? key, required this.getIndex,required this.acceptanceData}) : super(key: key);

  @override
  State<TournamentDetailBottomSheetWidget> createState() => _TournamentDetailBottomSheetWidgetState();
}

class _TournamentDetailBottomSheetWidgetState extends State<TournamentDetailBottomSheetWidget>
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
      maxChildSize: 0.9,
      minChildSize: 0.5,
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
                    widget.getIndex(index);
                  },
                  isScrollable: true,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24, vertical: Sizes.dimen_28),
                  unselectedLabelColor: AppColor.text5,
                  labelStyle: AppTextStyle.bold24,
                  unselectedLabelStyle: AppTextStyle.bold24,
                  labelColor: AppColor.text1,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorColor: Colors.transparent,
                  tabs: const [
                    Text("General"),
                    Text("Acceptance list"),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: TabBarView(
                    controller: tabController,
                    children:  [
                      const GeneralTabWidget(),
                      AcceptanceListTabWidget(acceptanceData: widget.acceptanceData),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
