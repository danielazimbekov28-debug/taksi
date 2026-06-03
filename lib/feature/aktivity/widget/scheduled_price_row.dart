import 'package:flutter/material.dart';

class ScheduledPriceRow extends StatelessWidget {
  final String title;
  final String price;
  final bool isPromo;
  final bool isTotal;

  const ScheduledPriceRow({
    super.key,
    required this.title,
    required this.price,
    this.isPromo = false,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: isTotal ? Colors.black : Colors.grey,
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: isPromo ? Colors.red : Colors.black,
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}