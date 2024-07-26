import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../view_models/calender_view_model.dart';
import '../widgets/schedule_tab_view.dart';
import '../widgets/task_tab_view.dart';
import '../widgets/time_line_widget.dart';

class CalenderPage extends ConsumerStatefulWidget {
  const CalenderPage({super.key});

  @override
  ConsumerState<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends ConsumerState<CalenderPage>
    with SingleTickerProviderStateMixin {
  late final viewModel = ref.read(calenderViewModel.notifier);
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TimeLineWidget(),
        // Weird bug I have to manually set the font family
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.appPaddingVal,
          ),
          child: TabBar(
            controller: tabController,
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: GoogleFonts.urbanist(
              textStyle: AppTextStyle.button.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            unselectedLabelStyle: GoogleFonts.urbanist(
              textStyle: AppTextStyle.button.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.cadetGrey,
              ),
            ),
            tabs: const [
              Tab(
                text: 'Schedule',
              ),
              Tab(
                text: 'Tasks',
              ),
            ],
          ),
        ),
        Expanded(
          child: ColoredBox(
            color: AppColors.white,
            child: SizedBox(
              height: context.height * 0.5,
              child: TabBarView(
                controller: tabController,
                children: const [
                  ScheduleTabView(),
                  TaskTabView(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
