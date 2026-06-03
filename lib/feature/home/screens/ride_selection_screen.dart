import 'package:flutter/material.dart';
import '../widgets/ride_selection_bottom_sheet.dart';
import '../widgets/route_info_card.dart'; // Предполагается, что эта карточка у тебя уже есть

class RideSelectionScreen extends StatelessWidget {
  const RideSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Фон - Карта (Заглушка)
          Positioned.fill(
            child: Container(color: const Color(0xFFF0F4F8)),
          ),

          // 2. Кнопка "Назад" на карте
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // 3. Карточка маршрута (Откуда - Куда) сверху по центру
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 70, // Отступ, чтобы не перекрывать кнопку назад
            right: 16,
            child: const RouteInfoCard(),
          ),

          // 4. Кнопка "Моя геолокация" над шторкой
          Positioned(
            right: 16,
            bottom: MediaQuery.of(context).size.height * 0.45 + 16, // Примерная высота шторки
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.my_location, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),

          // 5. Нижняя панель с тарифами
          const Align(
            alignment: Alignment.bottomCenter,
            child: RideSelectionBottomSheet(),
          ),
        ],
      ),
    );
  }
}