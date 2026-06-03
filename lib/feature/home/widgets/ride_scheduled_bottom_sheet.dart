import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';
import '../../../core/theme/app_text_style.dart';

class RideScheduledBottomSheet extends StatelessWidget {
  const RideScheduledBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconRadius = 28.0;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Основная белая карточка
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.s24,
            iconRadius + AppSpacing.s16, // Отступ сверху с учетом выступающей иконки
            AppSpacing.s24,
            AppSpacing.s32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Ride scheduled!',
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              AppSpacing.h16,
              const Divider(color: AppColors.border, height: 1),
              AppSpacing.h24,
              // Дата и время поездки
              const Text(
                'Monday, Dec 23 - 16:00 PM',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacing.h8,
              // Поясняющий текст
              const Text(
                'You can see scheduled rides in the activity menu.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Кнопка подтверждения
              SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text('Got It', style: AppTextStyles.button),
                ),
              ),
              // Учет безопасной зоны нижних баров на девайсах
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
        // Выступающая синяя круглая иконка календаря
        Positioned(
          top: -iconRadius,
          child: Container(
            width: iconRadius * 2,
            height: iconRadius * 2,
            decoration: const BoxDecoration(
              color: Colors.blue, // Яркий акцентный синий цвет из макета
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.calendar_month,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}