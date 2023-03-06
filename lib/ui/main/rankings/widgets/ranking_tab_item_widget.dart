




import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/model/ranking/ranking_item_data.dart';


class RankingTabItemWidget extends StatelessWidget {
   RankingTabItemWidget({Key? key,required this.rankingItemData}) : super(key: key);
  List<RankingItemData> rankingItemData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical:Sizes.dimen_10),
      child: DataTable(
          headingRowHeight: Sizes.dimen_32,
          dataRowHeight: Sizes.dimen_48,
          columnSpacing: Sizes.dimen_8,
          dataTextStyle: AppTextStyle.medium12,
          headingTextStyle: AppTextStyle.regular12.copyWith(fontSize: Sizes.dimen_10),
          //headingRowColor: MaterialStateProperty.all(AppColor.primary),
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
          rows: List.generate(rankingItemData.length, (index)  {
            var item = rankingItemData[index];
            return DataRow(
            cells: [
               DataCell(
                  // index>1?Text('${index+1}'):
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('${index+1}'),
                 if(index<2) index==0? const Text('↑115',style: TextStyle(color: AppColor.green),):
                   const Text('↓1',style: TextStyle(color: AppColor.red1),),
                 ],
               )),
              DataCell(
                SizedBox(
                  width: Sizes.dimen_100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Text(
                        item.playerName,
                        style: AppTextStyle.semiBold14,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
                    item.points,
                    style: AppTextStyle.regular12.copyWith(color: AppColor.text3),
                  ))),
              DataCell(Center(
                  child: Text(
                    item.totalPoints,
                    style: AppTextStyle.regular12.copyWith(color: AppColor.text3),
                  ))),
            ],
          );})
          ),
    );
  }
}
