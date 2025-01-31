import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/app_button.dart';
import '../../view_models/home_view_model.dart';
import '../widgets/home_bottom_nav_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Consumer(
        builder: (context, ref, _) {
          final viewModel = ref.read(homeViewModel.notifier);
          final currentIndex = ref.watch(homeViewModel).currentIndex;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: viewModel.pages[currentIndex]['page'],
          );
        },
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Consumer(
        builder: (context, ref, _) {
          final viewModel = ref.read(homeViewModel.notifier);
          final currentIndex = ref.watch(homeViewModel).currentIndex;
          return Text(
            viewModel.pages[currentIndex]['title'],
          );
        },
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.lightGrey,
          width: 1.5,
        ),
      ),
      actions: [
        AppIconButton(
          onPressed: () {},
          child: Badge(
            backgroundColor: AppColors.error,
            smallSize: 10,
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 24,
              height: 24,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
