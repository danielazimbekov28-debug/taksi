import 'package:flutter/material.dart';

class ScheduledCarRow extends StatelessWidget {
  const ScheduledCarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F9ED),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.directions_car, color: Color(0xFF06C143), size: 30),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GoRide Car', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 4),
              Text('3-5 mins • 4 passengers', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('\$10.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF06C143))),
            SizedBox(height: 4),
            Text('\$12.50', style: TextStyle(color: Colors.grey, fontSize: 12, decoration: TextDecoration.lineThrough)),
          ],
        ),
      ],
    );
  }
}