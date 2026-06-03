import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFFE0E0E0),
          child: Icon(Icons.person, color: Colors.white, size: 30),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Michael Brown', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(width: 6),
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const Text('4.7', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              SizedBox(height: 4),
              Text('Toyota Camry, Black • DEF-9012', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Color(0xFFE8F9ED),
              shape: BoxShape.circle
          ),
          child: const Icon(Icons.chat_bubble_rounded, color: Color(0xFF06C143), size: 20),
        ),
      ],
    );
  }
}