import 'package:flutter/material.dart';

class RideSelectionBottomSheet extends StatefulWidget {
  const RideSelectionBottomSheet({super.key});

  @override
  State<RideSelectionBottomSheet> createState() => _RideSelectionBottomSheetState();
}

class _RideSelectionBottomSheetState extends State<RideSelectionBottomSheet> {
  // Индекс выбранного тарифа (по умолчанию первый)
  int selectedRideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            // Маленький серый индикатор (pull tab) сверху шторки
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),

            // Список тарифов
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildRideOption(
                    index: 0,
                    title: 'GoRide Car',
                    time: '3-5 mins',
                    passengers: '4 passengers',
                    price: '\$10.00',
                    oldPrice: '\$12.50',
                  ),
                  const SizedBox(height: 12),
                  _buildRideOption(
                    index: 1,
                    title: 'GoRide Car XL',
                    time: '4-6 mins',
                    passengers: '6 passengers',
                    price: '\$12.00',
                    oldPrice: '\$15.00',
                  ),
                  const SizedBox(height: 12),
                  _buildRideOption(
                    index: 2,
                    title: 'GoRide Car Plus',
                    time: '4-5 mins',
                    passengers: '4 passengers',
                    price: '\$13.20',
                    oldPrice: '\$16.50',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Divider(color: Color(0xFFEEEEEE), height: 1, thickness: 1),

            // Секция оплаты
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
              title: const Text('Payment', style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('GoRide Wallet', style: TextStyle(fontWeight: FontWeight.w500)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                ],
              ),
              onTap: () {},
            ),

            // Секция промокодов
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
              title: const Text('Promos / Vouchers', style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF00C853)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'EOYP25',
                      style: TextStyle(color: Color(0xFF00C853), fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                ],
              ),
              onTap: () {},
            ),

            const SizedBox(height: 16),

            // Нижний ряд кнопок: Календарь и Заказать
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Row(
                children: [
                  // Кнопка календаря (Schedule)
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF00C853), width: 1.5),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.calendar_today, color: Color(0xFF00C853), size: 20),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Основная кнопка бронирования
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF00C853),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Book GoRide Car',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Метод для создания карточки тарифа
  Widget _buildRideOption({
    required int index,
    required String title,
    required String time,
    required String passengers,
    required String price,
    required String oldPrice,
  }) {
    final isSelected = selectedRideIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedRideIndex = index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.transparent, // Светло-зеленый фон если выбран
          border: Border.all(
            color: isSelected ? const Color(0xFF00C853) : const Color(0xFFEEEEEE),
            width: isSelected ? 1.5 : 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Иконка машинки (заглушка)
            Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.directions_car, color: Color(0xFF00C853)),
            ),
            const SizedBox(width: 12),

            // Название и детали
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(width: 8),
                      const Icon(Icons.person, size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(passengers, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),

            // Цены и галочка
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isSelected)
                  const Icon(Icons.check_circle, color: Color(0xFF00C853), size: 18)
                else
                  const SizedBox(height: 18), // Отступ для выравнивания, когда нет галочки

                const SizedBox(height: 4),
                Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(
                  oldPrice,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}