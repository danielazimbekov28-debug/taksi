import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';

class TimeWheelPicker extends StatelessWidget {
  const TimeWheelPicker({super.key});

  static const List<String> _hours = ['13', '14', '15', '16', '17', '18', '19'];
  static const List<String> _minutes = ['57', '58', '59', '00', '01', '02', '03'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Зеленые разделительные линии для выделения активного элемента
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(height: 1.5, color: AppColors.primary.withOpacity(0.5)),
                const SizedBox(height: 46),
                Container(height: 1.5, color: AppColors.primary.withOpacity(0.5)),
              ],
            ),
          ),
          // Контент барабанов времени
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Колонка ЧАСОВ
              Expanded(
                child: _TimeColumn(
                  items: _hours,
                  selectedIndex: 3, // Индекс активного часа (16)
                ),
              ),
              // Разделитель секунд/минут
              const Text(
                ':',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Колонка МИНУТ с индикатором PM
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _TimeColumn(
                      items: _minutes,
                      selectedIndex: 3, // Индекс активных минут (00)
                    ),
                    // Метка PM справа от выделенного элемента
                    const Positioned(
                      right: AppSpacing.s24,
                      child: Text(
                        'PM',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimeColumn extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;

  const _TimeColumn({
    required this.items,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Статичное отображение для UI
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final bool isSelected = index == selectedIndex;
        return Container(
          height: 30,
          alignment: Alignment.center,
          child: Text(
            items[index],
            style: TextStyle(
              fontSize: isSelected ? 28 : 20,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primary : AppColors.textSecondary.withOpacity(0.6),
            ),
          ),
        );
      },
    );
  }
}