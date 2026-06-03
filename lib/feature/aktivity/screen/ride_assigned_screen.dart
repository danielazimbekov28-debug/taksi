import 'package:flutter/material.dart';
import '../widget/cansel_ride_button.dart';
import '../widget/driver_card.dart';
import '../widget/ride_deteil_row.dart';
import '../widget/route_points.dart';
// Импортируем наши новые виджеты
import '../widget/ride_car_row.dart';
import '../widget/ride_price_row.dart';


class RideAssignedScreen extends StatelessWidget {
  const RideAssignedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text('Ride Details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [IconButton(icon: const Icon(Icons.more_horiz, color: Colors.black), onPressed: () {})],
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
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: Text('Your Scheduled Ride', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 6),
                  const Center(child: Text('Monday, Dec 23 - 16:00 PM', style: TextStyle(color: Colors.grey, fontSize: 14))),
                  const SizedBox(height: 20),

                  // Карточка машины (Используем новый виджет)
                  const RideCarRow(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFFEEEEEE))),

                  // Глобальный виджет маршрута
                  const RoutePoints(
                    pickupLocation: 'Bobst Library',
                    dropoffLocation: 'Larchmont Hotel',
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFFEEEEEE))),

                  // Глобальная карточка водителя
                  const DriverCard(),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFFEEEEEE))),

                  // Параметры поездки (Заменили методы на новые StatelessWidget)
                  const RideDetailRow(title: 'Status', value: 'Scheduled', isStatus: true),
                  const RideDetailRow(title: 'Payment', value: 'GoRide Wallet'),
                  const RideDetailRow(title: 'Date', value: 'Dec 22, 2024'),
                  const RideDetailRow(title: 'Time', value: '09:41 AM'),
                  const RideDetailRow(title: 'Transaction ID', value: 'TRX1222240941', hasCopy: true),
                  const RideDetailRow(title: 'Booking ID', value: 'BKG720469', hasCopy: true),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFFEEEEEE))),

                  // Чек (Заменили на новые виджеты)
                  const RidePriceRow(title: 'Trip Fare', price: '\$12.50'),
                  const RidePriceRow(title: 'Discounts (20%)', price: '-\$2.50', isPromo: true),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(color: Color(0xFFEEEEEE))),
                  const RidePriceRow(title: 'Total Paid', price: '\$10.00', isTotal: true),
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
                      onPressed: () {},
                      child: const Text('Share Receipt', style: TextStyle(color: Color(0xFF06C143), fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Кнопка отмены (Используем новый виджет)
                  CancelRideButton(
                    onPressed: () {
                      // Логика отмены поездки
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

