import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';
import 'package:junior_tennis_organizer/ui/main/tournaments/widgets/tournaments_filter_bottom_sheet.dart';

import '../../../core/custom_widgets/custom_app_bar.dart';
import '../../../core/custom_widgets/custom_text_field.dart';
import '../../../cubit/tournaments/tournaments_cubit.dart';
import '../../../routes/app_routes.dart';
import 'widgets/tournament_list_widget.dart';

class TournamentsScreen extends StatelessWidget {
  const TournamentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TournamentsCubit, TournamentsState>(
  builder: (context, state) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(
          leading: const SizedBox.shrink(),
          context: context,
          title: 'Tournaments',
          centerTitle: true,
         actions:[IconButton(onPressed: (){
           showModalBottomSheet(
               context: context,
               isScrollControlled: true,
               shape: const RoundedRectangleBorder(
                   borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(Sizes.dimen_48), topRight: Radius.circular(Sizes.dimen_48))),
               builder: (context) {
                 return const TournamentsFilterBottomSheet();
               });
         }, icon: SvgPicture.asset(AppSvg.filter))] ,
        ),
        body: Column(
          children: [
            const SizedBox(height: Sizes.dimen_6),

            /// Search
            CustomTextField(
              hintText: 'Search',
              borderRadius: Sizes.dimen_18,
              fillColor: AppColor.white,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
              prefixIcon: SvgPicture.asset(AppSvg.search),
            ),

           const SizedBox(height: Sizes.dimen_24),

            /// List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                itemCount: state.tournamentDataList.length,
                itemBuilder: (ctx, index) => TournamentListWidget(
                  index: index,
                  tournamentData: state.tournamentDataList[index],
                  onTap:()=> context.read<TournamentsCubit>().goToTournamentDetail(index),
                ),
              ),
            )
          ],
        ),

    );
  },
);
  }
}
