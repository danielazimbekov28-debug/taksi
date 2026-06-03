import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';
import '../../../core/theme/app_text_style.dart';

class ConfirmRideBottomSheet extends StatelessWidget {
  const ConfirmRideBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: AppSpacing.s12, bottom: AppSpacing.s8),
            width: 38,
            height: 4,
            decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)),
          ),
          // Список доступных авто с примененными скидками
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
            child: Column(
              children: [
                _buildPromoRideItem('GoRide Car', '3-5 mins • 4 passengers', '\$10.00', '\$12.50', isSelected: true),
                _buildPromoRideItem('GoRide Car XL', '4-6 mins • 6 passengers', '\$12.00', '\$15.00'),
                _buildPromoRideItem('GoRide Car Plus', '4-5 mins • 4 passengers', '\$13.20', '\$16.60'),
              ],
            ),
          ),
          const Divider(color: AppColors.border, height: 1),
          // Строка выбора оплаты
          _buildActionRow(
            title: 'Payment',
            trailing: Row(
              children: const [
                Text('GoRide Wallet', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 15)),
                AppSpacing.w4,
                Icon(Icons.chevron_right, color: AppColors.textSecondary),
              ],
            ),
          ),
          const Divider(color: AppColors.border, height: 1),
          // Строка промокодов
          _buildActionRow(
            title: 'Promos / Vouchers',
            trailing: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s12, vertical: AppSpacing.s4),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.primaryLight.withOpacity(0.2),
                  ),
                  child: const Text('EOYP25', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13)),
                ),
                AppSpacing.w4,
                const Icon(Icons.chevron_right, color: AppColors.textSecondary),
              ],
            ),
          ),
          AppSpacing.h16,
          // Секция с кнопкой вызова и выбранным временем
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
            child: Row(
              children: [
                // Круглая кнопка с сохраненной датой планирования
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 1.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Dec 23', style: TextStyle(fontSize: 10, color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
                      Text('16:00', style: TextStyle(fontSize: 11, color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                AppSpacing.w16,
                // Кнопка подтверждения
                Expanded(
                  child: SizedBox(
                    height: 54,
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                      child: const Text('Schedule GoRide Car', style: AppTextStyles.button),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + AppSpacing.s12),
        ],
      ),
    );
  }

  Widget _buildPromoRideItem(String title, String subtitle, String promoPrice, String oldPrice, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.s8),
      padding: const EdgeInsets.all(AppSpacing.s12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryLight.withOpacity(0.1) : AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.directions_car, size: 32, color: AppColors.primary),
          AppSpacing.w12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                AppSpacing.h4,
                Text(subtitle, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_circle, color: AppColors.primary, size: 16),
                  AppSpacing.w4,
                  Text(promoPrice, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              Text(
                oldPrice,
                style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow({required String title, required Widget trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24, vertical: AppSpacing.s16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w500)),
          trailing,
        ],
      ),
    );
  }
}