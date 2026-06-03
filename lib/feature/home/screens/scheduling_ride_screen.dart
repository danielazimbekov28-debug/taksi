import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';
import '../widgets/route_info_card.dart';
import '../widgets/scheduling_bottom_sheet.dart';

class SchedulingRideScreen extends StatelessWidget {
  const SchedulingRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Подложка: Карта (заглушка)
          Positioned.fill(
            child: Container(color: AppColors.placeholder),
          ),
          // Верхняя карточка с маршрутом (используем уже созданную ранее)
          Positioned(
            top: MediaQuery.of(context).padding.top + AppSpacing.s12,
            left: AppSpacing.s24,
            right: AppSpacing.s24,
            child: const RouteInfoCard(),
          ),
          // Плавающие кнопки управления картой над BottomSheet
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Кнопка Назад
                      _FloatingMapButton(
                        icon: Icons.chevron_left,
                        onTap: () => Navigator.pop(context),
                      ),
                      // Кнопка Текущая геопозиция
                      _FloatingMapButton(
                        icon: Icons.my_location,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                AppSpacing.h16,
                // Нижняя шторка статуса
                const SchedulingBottomSheet(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingMapButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _FloatingMapButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.textPrimary, size: 26),
        onPressed: onTap,
      ),
    );
  }
}