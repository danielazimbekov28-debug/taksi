import 'package:flutter/material.dart';
import '../screen/ride_scheduled_Screen.dart';

class ScheduledTab extends StatelessWidget {
  const ScheduledTab({super.key});

  @override
  Widget build(BuildContext context) {
    final scheduledRides = [
      {'title': 'Larchmont Hotel', 'time': 'Monday, Dec 23 • 16:00 PM'},
      {'title': 'Strand Book Store', 'time': 'Tuesday, Dec 24 • 10:30 AM'},
      {'title': 'Angelika Film Center', 'time': 'Wednesday, Dec 25 • 19:00 PM'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: scheduledRides.length,
      itemBuilder: (context, index) {
        final ride = scheduledRides[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RideScheduledScreen()),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius: 6)],
            ),
            child: Row(
              children: [
                const Icon(Icons.directions_car, color: Color(0xFF06C143)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ride['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 4),
                      Text(ride['time']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
              ],
            ),
          ),
        );
      },
    );
  }
}