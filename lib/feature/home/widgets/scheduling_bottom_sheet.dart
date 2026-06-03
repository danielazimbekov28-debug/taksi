import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

import '../../../core/theme/app_spasing.dart';
import '../../../core/theme/app_text_style.dart';
import 'scheduling_indicator.dart';

class SchedulingBottomSheet extends StatelessWidget {
  const SchedulingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.s24,
        AppSpacing.s12,
        AppSpacing.s24,
        AppSpacing.s32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Декоративный ползунок (Handle)
          Container(
            width: 38,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          AppSpacing.h24,
          // Текст статуса
          const Text(
            'Scheduling your ride...',
            style: AppTextStyles.h2,
            textAlign: TextAlign.center,
          ),
          AppSpacing.h24,
          // Индикатор загрузки
          const SchedulingIndicator(),
          // Безопасная зона снизу
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}