import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';
import '../widgets/confirm_ride_bottom_sheet.dart';
import '../widgets/route_info_card.dart';

class ConfirmRideScreen extends StatelessWidget {
  const ConfirmRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Подложка интерактивной карты маршрута
          Positioned.fill(
            child: Container(color: AppColors.placeholder),
          ),
          // Карточка маршрута сверху (сверстана в шаге SelectRide)
          Positioned(
            top: MediaQuery.of(context).padding.top + AppSpacing.s12,
            left: AppSpacing.s24,
            right: AppSpacing.s24,
            child: const RouteInfoCard(),
          ),
          // Левая плавающая круглая кнопка "Назад"
          Positioned(
            top: MediaQuery.of(context).padding.top + 110,
            left: AppSpacing.s24,
            child: CircleAvatar(
              backgroundColor: AppColors.surface,
              radius: 24,
              child: IconButton(
                icon: const Icon(Icons.chevron_left, color: AppColors.textPrimary),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          // Панель подтверждения деталей заказа снизу
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ConfirmRideBottomSheet(),
          ),
        ],
      ),
    );
  }
}