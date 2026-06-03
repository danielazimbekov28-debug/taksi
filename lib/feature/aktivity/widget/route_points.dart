import 'package:flutter/material.dart';

class RoutePoints extends StatelessWidget {
  final String pickupLocation;
  final String dropoffLocation;

  const RoutePoints({
    super.key,
    required this.pickupLocation,
    required this.dropoffLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEFEFEF), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Слева: Иконки точек и соединительная линия
          Column(
            children: [
              const Icon(Icons.radio_button_checked, color: Color(0xFF06C143), size: 18),
              Container(
                width: 1,
                height: 24,
                color: const Color(0xFFE0E0E0),
              ),
              const Icon(Icons.location_on, color: Colors.red, size: 18),
            ],
          ),
          const SizedBox(width: 14),
          // Справа: Текста адресов и разделитель
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pickupLocation,
                  style: const TextStyle(fontSize: 14, color: Color(0xFF424242), fontWeight: FontWeight.w500),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(color: Color(0xFFEFEFEF), height: 1, thickness: 1),
                ),
                Text(
                  dropoffLocation,
                  style: const TextStyle(fontSize: 14, color: Color(0xFF424242), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}