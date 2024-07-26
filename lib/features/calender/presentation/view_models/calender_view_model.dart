import 'package:calendar_view/calendar_view.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/calender_page_state/calender_page_state.dart';

class CalenderViewModel extends Notifier<CalenderPageState> {
  late final EasyInfiniteDateTimelineController timelineController =
      EasyInfiniteDateTimelineController();

  final EventController eventController = EventController();

  @override
  CalenderPageState build() {
    eventController.addAll(
      [
        CalendarEventData(
          title: 'Sprint Review Period 02 in May 2022',
          color: Colors.red,
          date: DateTime.now(),
          startTime: DateTime.now().copyWith(hour: 1),
          endTime: DateTime.now().copyWith(hour: 2),
          endDate: DateTime.now(),
        ),
        CalendarEventData(
          title: 'Meeting with Client',
          color: Colors.red,
          date: DateTime.now().subtract(const Duration(days: 1)),
          startTime: DateTime.now()
              .subtract(const Duration(days: 1))
              .copyWith(hour: 3),
          endTime: DateTime.now()
              .subtract(const Duration(days: 1))
              .copyWith(hour: 4),
          endDate: DateTime.now().subtract(const Duration(days: 1)),
        ),
        CalendarEventData(
          title: 'Daily Standup',
          description: 'Discuss the new project',
          color: Colors.red,
          date: DateTime.now().add(const Duration(days: 1)),
          startTime:
              DateTime.now().add(const Duration(days: 1)).copyWith(hour: 2),
          endTime:
              DateTime.now().add(const Duration(days: 1)).copyWith(hour: 3),
          endDate: DateTime.now().add(const Duration(days: 1)),
        ),
      ],
    );
    return CalenderPageState(
      focusDate: DateTime.now(),
    );
  }

  void onForward() {
    timelineController.animateToDate(
      state.focusDate!.add(
        const Duration(days: 1),
      ),
    );
  }

  void onBackward() {
    timelineController.jumpToDate(
      state.focusDate!.subtract(
        const Duration(days: 7),
      ),
    );
  }

  void onDateChange(DateTime date) {
    state = state.copyWith(focusDate: date);
  }
}

final calenderViewModel =
    NotifierProvider<CalenderViewModel, CalenderPageState>(
        CalenderViewModel.new);
