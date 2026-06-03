import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';

class RouteInfoCard extends StatelessWidget {
  const RouteInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Левая колонка с иконками и разделительной линией
          Column(
            children: [
              const Icon(Icons.circle, color: AppColors.primary, size: 14),
              Container(
                width: 1.5,
                height: 24,
                color: AppColors.border,
              ),
              const Icon(Icons.location_on, color: Colors.red, size: 16),
            ],
          ),
          AppSpacing.w16,
          // Центральная колонка с адресами
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bobst Library',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.s4),
                  child: Divider(color: AppColors.border, height: 1),
                ),
                Text(
                  'Larchmont Hotel',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.w12,
          // Правая кнопка добавления точки
          const Icon(
            Icons.add,
            color: AppColors.primary,
            size: 24,
          ),
        ],
      ),
    );
  }
}