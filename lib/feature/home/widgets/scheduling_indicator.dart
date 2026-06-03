import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class SchedulingIndicator extends StatelessWidget {
  const SchedulingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Внешний круг (полупрозрачная обводка)
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
          // Средний круг (чуть более яркая обводка)
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withOpacity(0.6),
                width: 2,
              ),
            ),
          ),
          // Внутренний круг (заливка)
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}