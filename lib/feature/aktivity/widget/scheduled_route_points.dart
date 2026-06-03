import 'package:flutter/material.dart';

class ScheduledRoutePoints extends StatelessWidget {
  final String pickupLocation;
  final String dropoffLocation;

  const ScheduledRoutePoints({
    super.key,
    required this.pickupLocation,
    required this.dropoffLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Icon(Icons.radio_button_checked, color: Color(0xFF06C143), size: 20),
            Container(width: 2, height: 40, color: Colors.grey.shade300),
            const Icon(Icons.location_on, color: Colors.red, size: 20),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pickupLocation, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 42),
              Text(dropoffLocation, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
        )
      ],
    );
  }
}