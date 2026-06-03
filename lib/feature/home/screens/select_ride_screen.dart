import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';
import '../widgets/ride_options_bottom_sheet.dart';
import '../widgets/route_info_card.dart';

class SelectRideScreen extends StatelessWidget {
  const SelectRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Фоновый слой: Карта-заглушка
          Positioned.fill(
            child: Container(color: AppColors.placeholder),
          ),
          // Верхний оверлей: Отображение маршрута
          Positioned(
            top: MediaQuery.of(context).padding.top + AppSpacing.s12,
            left: AppSpacing.s24,
            right: AppSpacing.s24,
            child: const RouteInfoCard(),
          ),
          // Нижний оверлей: Список доступных тарифов поездки
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: RideOptionsBottomSheet(),
          ),
        ],
      ),
    );
  }
}