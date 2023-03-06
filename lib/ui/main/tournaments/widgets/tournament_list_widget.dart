import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';

import '../../../../data/model/tournaments/tournament_data.dart';

class TournamentListWidget extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
TournamentData tournamentData;
   TournamentListWidget({Key? key, required this.index, required this.onTap,required this.tournamentData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      delay: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: Sizes.dimen_20),
          padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_20, vertical: Sizes.dimen_16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.dimen_20),
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1), spreadRadius: Sizes.dimen_0,
                blurRadius: Sizes.dimen_10,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Row(
            children: [
              /// Calendar
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SvgPicture.asset(AppSvg.calendar, height: Sizes.dimen_64, width: Sizes.dimen_64),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        tournamentData.month,
                        style: AppTextStyle.regular12.copyWith(fontSize: Sizes.dimen_10),
                      ),
                      Text(tournamentData.day, style: AppTextStyle.bold24),
                    ],
                  )
                ],
              ),
            const SizedBox(width: Sizes.dimen_8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Sizes.dimen_2),

                    /// Flag and ITF
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Flag
                        Row(
                          children: [
                            SvgPicture.asset(tournamentData.flag),
                    const SizedBox(width: Sizes.dimen_4),
                            Text(
                              tournamentData.city,
                              style: AppTextStyle.regular14.copyWith(
                                color: AppColor.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),

                        /// ITF
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_8, vertical: Sizes.dimen_6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.dimen_6),
                            border: Border.all(color: AppColor.grey),
                          ),
                          child: Text(
                            tournamentData.type,
                            style: AppTextStyle.medium14.copyWith(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  const SizedBox(height: Sizes.dimen_4),
                     Text(
                      tournamentData.title,
                      style: AppTextStyle.bold18,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: Sizes.dimen_4),

                    /// Detail
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppSvg.user),
                            const SizedBox(width: Sizes.dimen_4),
                            Text(
                              tournamentData.ageGroup,
                              style: AppTextStyle.regular14.copyWith(
                                color: AppColor.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppSvg.category),
                           const SizedBox(width: Sizes.dimen_4),
                            Text(
                              'Category ${tournamentData.category}',
                              style: AppTextStyle.regular14.copyWith(
                                color: AppColor.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
