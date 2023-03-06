import 'package:flutter/material.dart';
import 'package:junior_tennis_organizer/cubit/tournaments/tournaments_cubit.dart';
import 'package:junior_tennis_organizer/ui/main/tournaments/widgets/filter_drop_down_widget.dart';

import '../../../../core/custom_widgets/custom_button.dart';
import '../../../../core/custom_widgets/custom_text_field.dart';
import '../../../../core/theme/theme.dart';

class TournamentsFilterBottomSheet extends StatelessWidget {
  const TournamentsFilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Sizes.dimen_30),
              topRight: Radius.circular(Sizes.dimen_30),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                offset: const Offset(0, -3),
                blurRadius: Sizes.dimen_10,
              )
            ]),
        child: Stack(
          children: [
            /// Filter fields
            Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24, vertical: Sizes.dimen_8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// drag container
                    Container(
                      height: Sizes.dimen_5,
                      width: Sizes.dimen_48,
                      decoration: BoxDecoration(
                        color: AppColor.text5,
                        borderRadius: BorderRadius.circular(Sizes.dimen_4),
                      ),
                    ),
                const SizedBox(height: Sizes.dimen_24),

                    /// League
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'League',
                          style: AppTextStyle.regular16,
                        ),
                        FilterDropDownWidget(
                          getValue: (value) {},
                          data: TournamentsCubit.leagueData,
                        ),
                      ],
                    ),
                const SizedBox(height: Sizes.dimen_24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Age',
                          style: AppTextStyle.regular16,
                        ),
                        SizedBox(
                          width: Sizes.dimen_220,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.grey),
                              borderRadius: BorderRadius.circular(Sizes.dimen_16),
                            ),
                            child:  const CustomTextField(
                              hintText: 'Enter your age',
                              borderWidth: 1,
                              borderRadius: 16,
                            ),
                          ),
                        ),
                      ],
                    ),

                const SizedBox(height: Sizes.dimen_24),

                    /// Category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Category',
                          style: AppTextStyle.regular16,
    ),
                        FilterDropDownWidget(
                          getValue: (value) {},
                          data: TournamentsCubit.categoryData,
                        ),
                      ],
                    ),
                const SizedBox(height: Sizes.dimen_24),


                    /// Host nation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Host nation',
                          style: AppTextStyle.regular16,
                        ),
                        FilterDropDownWidget(
                          getValue: (value) {},
                          data: TournamentsCubit.nationData,
                        ),
                      ],
                    ),
                    const SizedBox(height: Sizes.dimen_24),

                    /// Registration Status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Registration status',
                          style: AppTextStyle.regular16,
                        ),
                        FilterDropDownWidget(
                          getValue: (value) {},
                          data: TournamentsCubit.status,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// Buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24, vertical: Sizes.dimen_16),
                decoration: const BoxDecoration(
                    color: AppColor.white,
                    border: Border(
                        top: BorderSide(
                          color: AppColor.grey,
                        ))),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {},
                        text: 'Reset filters',
                        backgroundColor: AppColor.white,
                        fontColor: AppColor.text1,
                        padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_14),
                        border: Border.all(width: Sizes.dimen_2,color: AppColor.primary),
                      ),
                    ),
                    const SizedBox(width: Sizes.dimen_16),
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: 'Search',
                        backgroundColor: AppColor.primary,
                        fontColor: AppColor.text1,
                        padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_14),

                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
