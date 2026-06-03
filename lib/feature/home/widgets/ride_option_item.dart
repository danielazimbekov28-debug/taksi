import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';


class RideOptionItem extends StatelessWidget {
  final String title;
  final String eta;
  final String capacity;
  final String price;
  final bool isSelected;
  final IconData icon;

  const RideOptionItem({
    super.key,
    required this.title,
    required this.eta,
    required this.capacity,
    required this.price,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s12),
      padding: const EdgeInsets.all(AppSpacing.s16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryLight.withOpacity(0.3) : AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          // Иконка транспорта (заглушка вместо кастомных ассетов машины/скутера)
          Icon(
            icon,
            size: 36,
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),
          AppSpacing.w16,
          // Информация о тарифе
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                AppSpacing.h4,
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: AppColors.textSecondary.withOpacity(0.7)),
                    AppSpacing.w4,
                    Text(
                      eta,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                    ),
                    AppSpacing.w12,
                    Icon(Icons.person_outline, size: 14, color: AppColors.textSecondary.withOpacity(0.7)),
                    AppSpacing.w4,
                    Text(
                      capacity,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Цена
          Text(
            price,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}