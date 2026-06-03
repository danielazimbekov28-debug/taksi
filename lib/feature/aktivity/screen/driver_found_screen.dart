import 'package:flutter/material.dart';
import '../widget/driver_card.dart';
import 'ride_assigned_screen.dart';

class DriverFoundScreen extends StatefulWidget {
  const DriverFoundScreen({super.key});

  @override
  State<DriverFoundScreen> createState() => _DriverFoundScreenState();
}

class _DriverFoundScreenState extends State<DriverFoundScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDriverBottomSheet();
    });
  }

  void _showDriverBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(color: Color(0xFF06C143), shape: BoxShape.circle),
                child: const Icon(Icons.person_pin, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 20),
              const Text(
                  "We've found the driver!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 20),

              // ИСПОЛЬЗУЕМ ГЛОБАЛЬНЫЙ ВИДЖЕТ: Вместо старого метода вызываем наш класс
              const DriverCard(),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF06C143),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const RideAssignedScreen()),
                    );
                  },
                  child: const Text(
                      'Got It',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Делаем красивый полупрозрачный фон, пока снизу открыто окно
      backgroundColor: Colors.black.withOpacity(0.5),
    );
  }
}