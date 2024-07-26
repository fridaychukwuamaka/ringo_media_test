import 'package:calendar_view/calendar_view.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../view_models/calender_view_model.dart';

class ScheduleTabView extends ConsumerWidget {
  const ScheduleTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(calenderViewModel.notifier);
    final state = ref.watch(calenderViewModel);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.appPaddingVal,
      ).copyWith(top: 16),
      child: DayView(
        key: ValueKey(state),
        controller: viewModel.eventController,
        pageViewPhysics: const NeverScrollableScrollPhysics(),
        eventTileBuilder: (date, events, boundary, startDuration, endDuration) {
          return EventTile(
            title: events.singleWhereOrNull((e) {
                  final x = startDuration;
                  final y = e.startTime ?? DateTime(1000);
                  return x.isSameTime(y);
                })?.title ??
                '',
            startDuration: startDuration,
            endDuration: endDuration,
          );
        },
        fullDayEventBuilder: (events, date) => const SizedBox.shrink(),
        timeLineBuilder: (day) => Container(
          padding: const EdgeInsets.only(right: 8),
          alignment: Alignment.centerRight,
          child: Text(
            DateFormat('HH:mm').format(day),
            style: AppTextStyle.overline.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      
        showVerticalLine: false,
        timeLineWidth: 40,
        showLiveTimeLineInAllDays: true,
        minDay: DateTime(1990),
        maxDay: DateTime(2250),
        initialDay: state.focusDate,
        heightPerMinute: 1.4,
        eventArranger: const SideEventArranger(),
        dayTitleBuilder: DayHeader.hidden,
        keepScrollOffset: true,
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  const EventTile({
    required this.startDuration,
    required this.endDuration,
    required this.title,
    super.key,
  });

  final DateTime startDuration;
  final DateTime endDuration;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF9F1FB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: const BoxDecoration(
                color: Color(0xFFD08CDF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.body2.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        IconlyBold.time_circle,
                        size: 14,
                        color: AppColors.cadetGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${DateFormat('hh:mm a').format(startDuration)} - ${DateFormat('hh:mm a').format(endDuration)}',
                        style: AppTextStyle.overline.copyWith(
                          color: AppColors.cadetGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
