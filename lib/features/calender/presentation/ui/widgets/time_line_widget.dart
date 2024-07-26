import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/app_button.dart';
import '../../view_models/calender_view_model.dart';

class TimeLineWidget extends ConsumerWidget {
  const TimeLineWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final viewModel = ref.read(calenderViewModel.notifier);
    final state = ref.watch(calenderViewModel);

    return EasyInfiniteDateTimeLine(
      controller: viewModel.timelineController,
      firstDate: DateTime(2023),
      focusDate: state.focusDate,
      lastDate: DateTime(2100, 12, 31),
      itemBuilder: (context, date, focused, __) {
        return Center(
          child: GestureDetector(
            onTap: () => viewModel.onDateChange(date),
            child: Container(
              width: context.width * 0.128,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: focused ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(date).toUpperCase(),
                    style: AppTextStyle.overline.copyWith(
                      fontWeight: FontWeight.w700,
                      color: focused ? AppColors.white : AppColors.cadetGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date.day.toString(),
                    style: AppTextStyle.body1.copyWith(
                      fontWeight: FontWeight.w700,
                      color: focused ? AppColors.white : AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      headerBuilder: (context, date) {
        return Padding(
          padding: EdgeInsets.all(context.appPaddingVal).copyWith(
            bottom: 0,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  context.showModal(const ChooseDateWidget());
                },
                child: Row(
                  children: [
                    Text(
                      DateFormat('MMMM yyyy').format(date),
                      style: AppTextStyle.button.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(FeatherIcons.chevronDown),
                  ],
                ),
              ),
              const Spacer(),
              AppIconButton(
                onPressed: viewModel.onBackward,
                child: const Icon(
                  FeatherIcons.chevronLeft,
                ),
              ),
              const SizedBox(width: 8),
              AppIconButton(
                onPressed: viewModel.onForward,
                child: const Icon(
                  FeatherIcons.chevronRight,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChooseDateWidget extends ConsumerWidget {
  const ChooseDateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final PageController pageController;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Opacity(
                  opacity: 0,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(FeatherIcons.x),
                  ),
                ),
                Text(
                  'Choose Date',
                  style: AppTextStyle.body1.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(FeatherIcons.x),
                )
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.appPaddingVal - 10,
            ),
            child: TableCalendar(
              daysOfWeekHeight: 0,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              startingDayOfWeek: StartingDayOfWeek.monday,
              focusedDay: DateTime.now(),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: AppTextStyle.button.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                leftChevronVisible: false,
                rightChevronVisible: false,
              ),
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
              onCalendarCreated: (v) => pageController = v,
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (_, date) => Column(
                  children: [
                    SizedBox(
                      height: 36,
                      child: Row(
                        children: List.generate(
                          7,
                          (index) => Expanded(
                            child: Text(
                              dow[index],
                              textAlign: TextAlign.center,
                              style: AppTextStyle.body1.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12)
                          .copyWith(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: const Icon(FeatherIcons.chevronLeft),
                          ),
                          const Spacer(),
                          Text(
                            DateFormat('MMMM yyyy').format(date),
                            style: AppTextStyle.button.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: const Icon(FeatherIcons.chevronRight),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                dowBuilder: (_, day) => const SizedBox.shrink(),
                todayBuilder: (_, date, __) => Container(
                  margin: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    date.day.toString(),
                    style: AppTextStyle.body1.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                defaultBuilder: (_, date, __) => Container(
                  margin: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  child: Text(
                    date.day.toString(),
                    style: AppTextStyle.body1.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                outsideBuilder: (context, date, focusedDay) => Container(
                  margin: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  child: Text(
                    date.day.toString(),
                    style: AppTextStyle.body1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.disabled,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(height: 48),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.appPaddingVal),
            child: AppButton(
              buttonTitle: 'Continue',
              width: double.infinity,
              onPressed: () {},
            ),
          ),
          SizedBox(height: context.bottom),
        ],
      ),
    );
  }
}

List dow = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
