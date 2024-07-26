import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../calender/presentation/ui/pages/calender_page.dart';
import '../../../project/presentation/ui/pages/project_summary_page.dart';
import '../states/home_state/home_state.dart';

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() => const HomeState();

  void goTo(int index) {
    state = state.copyWith(currentIndex: index);
  }

  List<Map<String, dynamic>> pages = [
    {
      'title': 'Dashboard',
      'page': const ProjectSummaryPage(),
    },
    {
      'title': 'Project Summary',
      'page': const ProjectSummaryPage(),
    },
    {
      'title': 'Calender',
      'page': const CalenderPage(),
    },
    {
      'title': 'Profile',
      'page': const ProjectSummaryPage(),
    },
  ];
}

final homeViewModel =
    NotifierProvider<HomeViewModel, HomeState>(HomeViewModel.new);
