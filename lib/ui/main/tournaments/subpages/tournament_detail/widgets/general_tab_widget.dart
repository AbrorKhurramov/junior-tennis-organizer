import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/theme.dart';


class GeneralTabWidget extends StatelessWidget {
  const GeneralTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_24),
      child: Column(
        children: [
          /// Court and fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Court surface',
                    style: AppTextStyle.regular14.copyWith(color: AppColor.text5),
                  ),
                  const SizedBox(height: Sizes.dimen_6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppSvg.court),
                      const SizedBox(width: Sizes.dimen_4),
                      const Text(
                        'Outdoor/Hard',
                        style: AppTextStyle.regular14,
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
                    'Entry fee',
                    style: AppTextStyle.regular14.copyWith(color: AppColor.text5),
                  ),
                  const SizedBox(height: Sizes.dimen_6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppSvg.fee),
                      const SizedBox(width: Sizes.dimen_4),
                      const Text(
                        '\$50',
                        style: AppTextStyle.regular14,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: Sizes.dimen_20),

          /// deadline
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Entry deadline',
                    style: AppTextStyle.regular14.copyWith(color: AppColor.text5),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppSvg.calendarMini),
                      const SizedBox(width: Sizes.dimen_4),
                      const Text(
                        'Sept 27,\n2021 00:00GMT',
                        style: AppTextStyle.regular14,
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
                    'Withdrawal deadline',
                    style: AppTextStyle.regular14.copyWith(color: AppColor.text5),
                  ),
                  const SizedBox(height: Sizes.dimen_6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppSvg.calendarMini),
                      const SizedBox(width: Sizes.dimen_4),
                      const Text(
                        'Sept 27,\n2021 00:00GMT',
                        style: AppTextStyle.regular14,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: Sizes.dimen_20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hospitality',
              style: AppTextStyle.regular14.copyWith(color: AppColor.text5),
            ),
          ),

          const SizedBox(height: Sizes.dimen_6),

          /// Hospitality
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppSvg.hospital),
              const SizedBox(width: Sizes.dimen_8),
              const Expanded(
                  child: Text(
                    'Free hospitality for all National Squads and individual players must be granted, including all Main Draws (main draw and Doubles) and Bonus Draw players and free lunch and dinner to Qualifying Draw individual players',
                    style: AppTextStyle.regular14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
          const SizedBox(height: Sizes.dimen_20),

          /// Address
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Adress',
              style: AppTextStyle.regular14.copyWith(color: AppColor.text5),
            ),
          ),
          const SizedBox(height: Sizes.dimen_6),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppSvg.location),
              const SizedBox(width: Sizes.dimen_8),
              const Expanded(
                child: Text(
                  'Arena Approach, Horwich Parkway, BL66LB Bolton, Great Britain',
                  style: AppTextStyle.regular14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: Sizes.dimen_20),

          /// Key
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tournament key',
              style: AppTextStyle.regular14.copyWith(color: AppColor.text5),
            ),
          ),
          const SizedBox(height: Sizes.dimen_6),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppSvg.key),
              const SizedBox(width: Sizes.dimen_8),
              const Expanded(
                child: Text(
                  'TE-LTU-47A-2021',
                  style: AppTextStyle.regular14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
