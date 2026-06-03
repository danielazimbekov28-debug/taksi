import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';
import 'ride_option_item.dart';

class RideOptionsBottomSheet extends StatelessWidget {
  const RideOptionsBottomSheet({super.key});

  // Статический массив для наполнения UI элементов списка
  static const List<Map<String, dynamic>> _rideOptions = [
    {
      'title': 'GoRide Car',
      'eta': '3-5 mins',
      'capacity': '4 passengers',
      'price': '\$12.50',
      'icon': Icons.directions_car,
      'isSelected': true,
    },
    {
      'title': 'GoRide Car XL',
      'eta': '4-6 mins',
      'capacity': '6 passengers',
      'price': '\$15.00',
      'icon': Icons.local_taxi,
      'isSelected': false,
    },
    {
      'title': 'GoRide Car Plus',
      'eta': '4-5 mins',
      'capacity': '4 passengers',
      'price': '\$16.50',
      'icon': Icons.directions_car_filled,
      'isSelected': false,
    },
    {
      'title': 'GoRide Car Premium',
      'eta': '4-5 mins',
      'capacity': '4 passengers',
      'price': '\$20.00',
      'icon': Icons.time_to_leave,
      'isSelected': false,
    },
    {
      'title': 'GoRide Scooter',
      'eta': '3-4 mins',
      'capacity': '1 passenger',
      'price': '\$6.00',
      'icon': Icons.two_wheeler,
      'isSelected': false,
    },
    {
      'title': 'GoRide Scooter Comfort',
      'eta': '4-5 mins',
      'capacity': '1 passenger',
      'price': '\$8.00',
      'icon': Icons.moped,
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Декоративный индикатор скролла сверху (Handle бар)
          Container(
            margin: const EdgeInsets.only(top: AppSpacing.s12, bottom: AppSpacing.s8),
            width: 38,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Ограничиваем высоту контентной части для корректного отображения карты сверху
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.55,
            ),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
              itemCount: _rideOptions.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final option = _rideOptions[index];
                return RideOptionItem(
                  title: option['title'] as String,
                  eta: option['eta'] as String,
                  capacity: option['capacity'] as String,
                  price: option['price'] as String,
                  icon: option['icon'] as IconData,
                  isSelected: option['isSelected'] as bool,
                );
              },
            ),
          ),
          // Безопасная зона для устройств без физических кнопок снизу
          SizedBox(height: MediaQuery.of(context).padding.bottom + AppSpacing.s8),
        ],
      ),
    );
  }
}