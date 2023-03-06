import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junior_tennis_organizer/core/custom_widgets/custom_app_bar.dart';
import 'package:junior_tennis_organizer/data/model/tournaments/tournament_data.dart';

import '../../../../../core/custom_widgets/custom_button.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../cubit/tournaments/tournaments_cubit.dart';
import 'widgets/tournament_detail_bottom_sheet.dart';

class TournamentDetailScreen extends StatefulWidget {
  const TournamentDetailScreen({Key? key,required this.arguments}) : super(key: key);
final TournamentData arguments;
  @override
  State<TournamentDetailScreen> createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState extends State<TournamentDetailScreen> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentsCubit, TournamentsState>(
  builder: (context, state) {
    return Scaffold(
      appBar: customAppBar(context: context,
      color: AppColor.transparent
      ),
      body: Stack(
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ITF
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_8, vertical: Sizes.dimen_6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.dimen_6),
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Text(
                        widget.arguments.type,
                        style: AppTextStyle.medium14.copyWith(fontSize: 10),
                      ),
                    ),
                    const SizedBox(height: Sizes.dimen_6),

                    ///Title
                     Text(
                      widget.arguments.title,
                      style: AppTextStyle.bold24,
                    ),
                    const SizedBox(height: Sizes.dimen_6,),
                    Text(
                      'Registration open',
                      style: AppTextStyle.regular14.copyWith(color: AppColor.text2),
                    ),

                    const SizedBox(height: Sizes.dimen_20,),

                    /// Nation, Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Host nation',
                              style: AppTextStyle.regular14.copyWith(color: AppColor.text3),
                            ),
                            const SizedBox(height: Sizes.dimen_6,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(widget.arguments.flag),
                                const SizedBox(width: Sizes.dimen_4,),
                                 Text(
                                  '${widget.arguments.city},\n${widget.arguments.hostNation}',
                                  style: AppTextStyle.semiBold14,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Tournament days',
                              style: AppTextStyle.regular14.copyWith(color: AppColor.text3),
                            ),
                            const SizedBox(height: Sizes.dimen_6,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppSvg.calendarMini),
                                const SizedBox(width: Sizes.dimen_4,),
                                 Text(
                                  widget.arguments.tournamentDays,
                                  style: AppTextStyle.semiBold14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: Sizes.dimen_20,),

                    /// Group, Category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Age group',
                              style: AppTextStyle.regular14.copyWith(color: AppColor.text3),
                            ),
                            const SizedBox(height: Sizes.dimen_6,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppSvg.user),
                                const SizedBox(width: Sizes.dimen_4,),
                                 Text(
                                   widget.arguments.ageGroup,
                                  style: AppTextStyle.semiBold14,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Category',
                              style: AppTextStyle.regular14.copyWith(color: AppColor.text3),
                            ),
                            const SizedBox(height: Sizes.dimen_6),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppSvg.category),
                                const SizedBox(width: Sizes.dimen_4),
                                 Text(
                                  'Category ${widget.arguments.category}                 ',
                                  style: AppTextStyle.semiBold14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          TournamentDetailBottomSheetWidget(
            getIndex: (int index) {
              buttonIndex = index;
              setState(() {});
            },
            acceptanceData:state.acceptanceList,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24, vertical: Sizes.dimen_20),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColor.grey, width: 1.5)),
          color: AppColor.white,
        ),
        child: buttonIndex == 0
            ? CustomButton(
          onTap: () {},
          text: 'Delete from my Calendar',
          backgroundColor: AppColor.white,
          fontColor: AppColor.text1,
          border: Border.all(width: 2,color: AppColor.primary),
          padding: const EdgeInsets.symmetric(vertical: 12),
        )
            : CustomButton(
          onTap: () {},
          text: 'Add to my Calendar',
          backgroundColor: AppColor.primary,
          fontColor: AppColor.text1,
            padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  },
);
  }
}
