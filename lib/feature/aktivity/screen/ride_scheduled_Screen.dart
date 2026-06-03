import 'package:flutter/material.dart';
import '../widget/scheduled_сar_row.dart';
import 'driver_found_screen.dart'; // Импортируем второй экран

// Импортируем наши новые отдельные виджеты
// (Если ты назвал файлы по-другому, просто обнови пути импортов)
import '../widget/scheduled_route_points.dart';
import '../widget/scheduled_detail_row.dart';
import '../widget/scheduled_price_row.dart';
import '../widget/scheduled_cancel_button.dart';

class RideScheduledScreen extends StatelessWidget {
  const RideScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Ride Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz, color: Colors.black), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text('Your Scheduled Ride', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 6),
                  const Center(
                    child: Text('Monday, Dec 23 - 16:00 PM', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ),
                  const SizedBox(height: 20),

                  // ЗЕЛЕНЫЙ БАННЕР (Водитель еще ищется)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(color: const Color(0xFF06C143), borderRadius: BorderRadius.circular(12)),
                    child: const Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "We'll notify you when a driver's found",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Карточка машины
                  const ScheduledCarRow(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFFEEEEEE))),

                  // Маршрут точки А и Б
                  const ScheduledRoutePoints(
                    pickupLocation: 'Bobst Library',
                    dropoffLocation: 'Larchmont Hotel',
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFFEEEEEE))),

                  // Параметры поездки
                  const ScheduledDetailRow(title: 'Status', value: 'Scheduled', isStatus: true),
                  const ScheduledDetailRow(title: 'Payment', value: 'GoRide Wallet'),
                  const ScheduledDetailRow(title: 'Date', value: 'Dec 22, 2024'),
                  const ScheduledDetailRow(title: 'Time', value: '09:41 AM'),
                  const ScheduledDetailRow(title: 'Transaction ID', value: 'TRX1222240941', hasCopy: true),
                  const ScheduledDetailRow(title: 'Booking ID', value: 'BKG720469', hasCopy: true),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFFEEEEEE))),

                  // Чек
                  const ScheduledPriceRow(title: 'Trip Fare', price: '\$12.50'),
                  const ScheduledPriceRow(title: 'Discounts (20%)', price: '-\$2.50', isPromo: true),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFFEEEEEE))),
                  const ScheduledPriceRow(title: 'Total Paid', price: '\$10.00', isTotal: true),
                ],
              ),
            ),

            // Кнопки внизу
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF06C143), width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DriverFoundScreen()),
                        );
                      },
                      child: const Text(
                        'Share Receipt',
                        style: TextStyle(color: Color(0xFF06C143), fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Кнопка отмены
                  ScheduledCancelButton(
                    onPressed: () {
                      // Логика отмены
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}