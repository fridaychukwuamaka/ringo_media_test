import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/app_button.dart';
import '../../../../../core/ui/widgets/app_input.dart';
import '../widgets/productivity_chart.dart';
import '../widgets/project_summaries.dart';

class ProjectSummaryPage extends ConsumerWidget {
  const ProjectSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(context.appPaddingVal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppInput(
                label: 'Search',
                hint: 'Search project here',
                suffix: SvgPicture.asset(
                  'assets/icons/search.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(height: 24),
              const ProjectSummaries(),
              const SizedBox(height: 24),
              AppOutlineButton(
                onPressed: () {},
                color: AppColors.primary,
                child: Text(
                  'View All Projects',
                  style: AppTextStyle.body2.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(context.appPaddingVal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Productivity',
                      style: AppTextStyle.button.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(14, 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                      ),
                    )
                  ],
                ),
              ),
              const ProductivityChart(),
              const SizedBox(height: 24)
            ],
          ),
        ),
      ],
    );
  }
}
