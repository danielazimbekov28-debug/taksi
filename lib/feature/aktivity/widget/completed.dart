import 'package:flutter/material.dart';
import '../screen/ride_deteil_screen.dart';

class CompletedTab extends StatelessWidget {
  const CompletedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RideDeteilScreen(status: '',)),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius: 6)],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Completed Ride Example', style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}