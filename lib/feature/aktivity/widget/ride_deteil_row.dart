import 'package:flutter/material.dart';

class RideDetailRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isStatus;
  final bool hasCopy;

  const RideDetailRow({
    super.key,
    required this.title,
    required this.value,
    this.isStatus = false,
    this.hasCopy = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          Row(
            children: [
              if (isStatus)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F9ED),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    value,
                    style: const TextStyle(color: Color(0xFF06C143), fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                )
              else
                Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              if (hasCopy) ...[
                const SizedBox(width: 6),
                const Icon(Icons.copy_rounded, color: Color(0xFF06C143), size: 16),
              ]
            ],
          ),
        ],
      ),
    );
  }
}