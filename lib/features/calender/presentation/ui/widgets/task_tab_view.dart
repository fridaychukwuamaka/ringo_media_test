import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';

class TaskTabView extends StatelessWidget {
  const TaskTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(context.appPaddingVal),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.06),
                blurRadius: 24,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meeting with the team',
                    style: AppTextStyle.body1.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Due Date : Mon, 12 Jan 2023',
                    style: AppTextStyle.caption2.copyWith(
                      color: AppColors.lightBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              const Icon(
                IconlyBold.tick_square,
                color: AppColors.success,
              )
            ],
          ),
        );
      },
    );
  }
}
