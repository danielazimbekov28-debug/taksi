import 'package:flutter/material.dart';

class ScheduledCancelButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ScheduledCancelButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFF7E7E7)),
          backgroundColor: const Color(0xFFFFF5F5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        onPressed: onPressed,
        child: const Text(
          'Cancel Ride',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}