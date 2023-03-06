import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';

import '../../../../data/model/home/followings_data.dart';

class FollowingsWidget extends StatelessWidget {
   FollowingsWidget({Key? key,required this.followingsData}) : super(key: key);
final List<FollowingsData> followingsData;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
      itemCount: followingsData.length,
      itemBuilder: (ctx, index) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(followingsData[index].image,width: Sizes.dimen_36,height: Sizes.dimen_36),
        title: Padding(
          padding: const EdgeInsets.only(right: Sizes.dimen_16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(followingsData[index].name, style: AppTextStyle.semiBold14),
              SvgPicture.asset(followingsData[index].flag,width: Sizes.dimen_20,height: Sizes.dimen_14, fit: BoxFit.fill)
            ],
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_12, vertical: Sizes.dimen_6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.dimen_16),
              border: Border.all(
                color: AppColor.grey,
                width: 1,
              )),
          child: const Text(
            'Unfollow',
            style: AppTextStyle.semiBold14,
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: AppColor.grey,
        thickness: 1,
      ),
    );
  }
}
