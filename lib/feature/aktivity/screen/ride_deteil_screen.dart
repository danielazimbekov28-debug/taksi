import 'package:flutter/material.dart';
// Импортируем наш шторку
import '../widget/compact_deteil_row.dart';
import '../widget/ride_addres_row.dart';
import '../widget/share_receipt_bottom_sheet.dart';
// Импортируем наши новые виджеты, которые мы только что создали
import '../widget/simple_receipt_row.dart';

class RideDeteilScreen extends StatelessWidget {
  final String status;

  const RideDeteilScreen({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text('Ride Details', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Плейсхолдер для карты
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(child: Icon(Icons.map, size: 40, color: Colors.blue)),
            ),
            const SizedBox(height: 24),

            // Информация о машине
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.directions_car, size: 40, color: Colors.green),
              title: Text('GoRide Car', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Honda Accord, White • XYZ-5678'),
              trailing: Text('\$12.75', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const Divider(),

            // Адреса (Заменили _buildAddressRow на RideAddressRow)
            const RideAddressRow(icon: Icons.my_location, text: 'New York University', color: Colors.green),
            const RideAddressRow(icon: Icons.location_on, text: 'Jefferson Market Library', color: Colors.red),
            const Divider(),

            // Детали оплаты (Заменили _buildDetailRow на CompactDetailRow)
            // Здесь const не пишем, так как status - переменная
            CompactDetailRow(label: 'Status', value: status, isStatus: true),
            const CompactDetailRow(label: 'Payment', value: 'GoRide Wallet'),
            const CompactDetailRow(label: 'Date', value: 'Dec 21, 2024'),
            const CompactDetailRow(label: 'Time', value: '09:56 AM'),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            // Чек (Заменили _buildReceiptRow на SimpleReceiptRow)
            const SimpleReceiptRow(label: 'Trip Fare', value: '\$15.00'),
            const SimpleReceiptRow(label: 'Discounts (15%)', value: '-\$2.25', isDiscount: true),

            if (status == 'Completed')
              const SimpleReceiptRow(label: 'Driver Tip', value: '\$5.00'),

            const Divider(),
            // Здесь тоже const убираем, так как значение зависит от переменной status
            SimpleReceiptRow(label: 'Total Paid', value: status == 'Completed' ? '\$17.75' : '\$12.75', isBold: true),

            const SizedBox(height: 40),

            // Кнопки
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  // УРОК АРХИТЕКТУРЫ: Вызываем шторку как отдельный виджет
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(24))
                    ),
                    builder: (context) => const ShareReceiptBottomSheet(),
                  );
                },
                child: const Text('Share Receipt', style: TextStyle(color: Colors.green, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

