import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:junior_tennis_organizer/core/theme/theme.dart';
import 'package:junior_tennis_organizer/cubit/tournaments/tournaments_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../routes/app_routes.dart';
import '../../tournaments/widgets/tournament_list_widget.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime headerDate = DateTime.now();
  DateTime focusedDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat('MMMM yyyy').format(focusedDate),
          style: AppTextStyle.bold18,
        ),
        const Divider(height: Sizes.dimen_12, thickness: Sizes.dimen_1),
        TableCalendar(
          availableGestures: AvailableGestures.none,
          rowHeight: Sizes.dimen_40,
          daysOfWeekHeight: Sizes.dimen_20,
          weekendDays: const [6, 7],
          firstDay: DateTime(2000),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: focusedDate,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: AppTextStyle.regular12.copyWith(color: AppColor.text5),
            weekendStyle: AppTextStyle.regular12.copyWith(color: AppColor.text5),
          ),
          headerVisible: false,
          calendarStyle: CalendarStyle(
            todayTextStyle: AppTextStyle.medium14,
            todayDecoration: BoxDecoration(
              color: AppColor.red,
              borderRadius: BorderRadius.circular(Sizes.dimen_6),
            ),
            selectedDecoration: const BoxDecoration(color: AppColor.green),
            rangeStartDecoration: const BoxDecoration(
              color: AppColor.green,
              shape: BoxShape.rectangle,
            ),
            rangeEndDecoration: const BoxDecoration(
              color: AppColor.green,
              shape: BoxShape.rectangle,
            ),
            defaultTextStyle: AppTextStyle.regular14,
            weekendTextStyle: AppTextStyle.regular14.copyWith(color: AppColor.text5),
            outsideTextStyle: AppTextStyle.regular14.copyWith(color: AppColor.grey),
            rangeHighlightColor: AppColor.primary,
            withinRangeTextStyle: AppTextStyle.regular14,
          ),
          rangeSelectionMode: _rangeSelectionMode,
          rangeStartDay: startDate,
          rangeEndDay: endDate,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onRangeSelected: (start, end, focusedDay) {
            setState(() {
              focusedDate = focusedDay;
              startDate = start;
              endDate = end;
              _rangeSelectionMode = RangeSelectionMode.toggledOn;
            });
          },
          onPageChanged: (focusedDay) {
            setState(() {
              focusedDate = focusedDay;
            });
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
          itemCount: 5,
          itemBuilder: (ctx, index)
             {
               final tournamentsCubit =  context.read<TournamentsCubit>();
               return
              TournamentListWidget(
            index: index,
            onTap:()=> tournamentsCubit.goToTournamentDetail(index),
                tournamentData: tournamentsCubit.state.tournamentDataList[index],
          );}
        )
      ],
    );
  }
}
