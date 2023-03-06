import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../../../data/model/tournaments/acceptance_list_data.dart';

class AcceptanceListTabWidget extends StatelessWidget {
   AcceptanceListTabWidget({Key? key,required this.acceptanceData}) : super(key: key);
List<AcceptanceListData> acceptanceData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
      child: Column(
        children: [
          /// Boys girls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Boys', style: AppTextStyle.semiBold14),
              Text('Girls', style: AppTextStyle.semiBold14),
            ],
          ),
          const SizedBox(height: Sizes.dimen_4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('16', style: AppTextStyle.regular14.copyWith(color: AppColor.text3)),
              Text('Singles main draw',
                  style: AppTextStyle.regular14.copyWith(color: AppColor.text5)),
              Text('20', style: AppTextStyle.regular14.copyWith(color: AppColor.text3)),
            ],
          ),
          const SizedBox(height: Sizes.dimen_2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('32', style: AppTextStyle.regular14.copyWith(color: AppColor.text3)),
              Text('Doubles main draw',
                  style: AppTextStyle.regular14.copyWith(color: AppColor.text5)),
              Text('24', style: AppTextStyle.regular14.copyWith(color: AppColor.text3)),
            ],
          ),
          const SizedBox(height: Sizes.dimen_2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('18', style: AppTextStyle.regular14.copyWith(color: AppColor.text3)),
              Text('Singles qualifying',
                  style: AppTextStyle.regular14.copyWith(color: AppColor.text5)),
              Text('26', style: AppTextStyle.regular14.copyWith(color: AppColor.text3)),
            ],
          ),

          const SizedBox(height: Sizes.dimen_16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                headingRowHeight: Sizes.dimen_32,
                dataRowHeight: Sizes.dimen_48,
                columnSpacing: Sizes.dimen_16,
                dataTextStyle: AppTextStyle.medium12,
                headingTextStyle: AppTextStyle.regular12.copyWith(fontSize: Sizes.dimen_10),
               // headingRowColor: MaterialStateProperty.all(AppColor.primary),
                showBottomBorder: true,
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Text('#'),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'PLAYER NAME',
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Center(
                        child: Text('YEAR OF BIRTH'),
                      ),
                    ),
                  ),
                  DataColumn(
                      label: Expanded(
                        child: Center(
                          child: Text('NATION'),
                        ),
                      )),
                  DataColumn(
                      label: Expanded(
                        child: Center(
                          child: Text('EVENTS PLAYED'),
                        ),
                      )),
                  DataColumn(
                      label: Expanded(
                        child: Center(
                          child: Text('POINTS'),
                        ),
                      )),
                  DataColumn(
                      label: Expanded(
                        child: Center(
                          child: Text('TOTAL POINTS'),
                        ),
                      )),
                ],
                rows: List.generate(acceptanceData.length, (index) {
                  var item = acceptanceData[index];
                  return DataRow(
                  cells: [
                     DataCell(Text('${index+1}.')),
                     DataCell(
                      SizedBox(
                        width:Sizes.dimen_100,
                        child: Text(
                          item.playerName,
                          style: AppTextStyle.semiBold14,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    DataCell(Center(
                        child: Text(
                          item.year.toString(),
                          style: AppTextStyle.regular12.copyWith(color: AppColor.text3),
                        ))),
                    DataCell(Center(child: SvgPicture.asset(item.flag))),
                    DataCell(Center(
                        child: Text(
                          item.eventsPlayed.toString(),
                          style: AppTextStyle.regular12.copyWith(color: AppColor.text3),
                        ))),
                    DataCell(Center(
                        child: Text(
                          item.points,
                          style: AppTextStyle.regular12.copyWith(color: AppColor.text3),
                        ))),
                    DataCell(Center(
                        child: Text(
                          item.totalPoints,
                          style: AppTextStyle.regular12.copyWith(color: AppColor.text3),
                        ))),
                  ],
                );})),
          )
        ],
      ),
    );
  }
}
