import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';
import '../widgets/ride_scheduled_bottom_sheet.dart';
import '../widgets/route_info_card.dart'; // Переиспользуем вашу готовую карточку маршрута

class RideScheduledScreen extends StatelessWidget {
  const RideScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Подложка: Карта
          Positioned.fill(
            child: Container(color: AppColors.placeholder),
          ),
          // Затемняющий оверлей для эффекта размытия/фокусировки на диалоге
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          // Ваша готовая первая карточка маршрута сверху
          Positioned(
            top: MediaQuery.of(context).padding.top + AppSpacing.s12,
            left: AppSpacing.s24,
            right: AppSpacing.s24,
            child: const RouteInfoCard(),
          ),
          // Нижняя шторка успешного завершения флоу
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: RideScheduledBottomSheet(),
          ),
        ],
      ),
    );
  }
}