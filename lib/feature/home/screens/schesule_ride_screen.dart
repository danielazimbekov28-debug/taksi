import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
     import '../widgets/schesule_bottom_sheet.dart';

class ScheduleRideScreen extends StatelessWidget {
  const ScheduleRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Задний фон: Затемненная карта из прошлого шага
          Positioned.fill(
            child: Container(
              color: AppColors.placeholder,
            ),
          ),
          // Эффект затемнения поверх карты, как на макете
          Positioned.fill(
            child: Container(
              color: AppColors.overlay.withOpacity(0.4),
            ),
          ),
          // Модальное окно планирования времени снизу
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ScheduleBottomSheet(),
          ),
        ],
      ),
    );
  }
}