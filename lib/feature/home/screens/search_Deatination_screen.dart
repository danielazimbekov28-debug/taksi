import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';
import '../../../core/theme/app_text_style.dart';
import '../widgets/recent_places_list.dart';

class SearchDestinationScreen1 extends StatelessWidget {
  const SearchDestinationScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.h12,
              // Заголовок с кнопкой закрыть
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textPrimary, size: 26),
                    onPressed: () => Navigator.pop(context),
                  ),
                  AppSpacing.w12,
                  const Text('Where do you want to go?', style: AppTextStyles.h1),
                ],
              ),
              AppSpacing.h24,
              // Панель ввода адресов
              Container(
                padding: const EdgeInsets.all(AppSpacing.s16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                child: Column(
                  children: [
                    _buildInputRow(Icons.circle, AppColors.primary, 'Your current location', isReadOnly: true),
                    Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(width: 1.5, height: 20, color: AppColors.border),
                      ),
                    ),
                    _buildInputRow(Icons.location_on, Colors.red, 'Where to?', hasAddButton: true),
                  ],
                ),
              ),
              AppSpacing.h16,
              // Быстрые теги (Chips)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildQuickChip(Icons.map_outlined, 'Select from map'),
                    AppSpacing.w8,
                    _buildQuickChip(Icons.home_outlined, 'Home'),
                    AppSpacing.w8,
                    _buildQuickChip(Icons.work_outline, 'Office'),
                  ],
                ),
              ),
              AppSpacing.h24,
              // Переключатель Recent / Suggested
              Container(
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: Text('Recent', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text('Suggested', style: TextStyle(color: AppColors.textSecondary)),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.h12,
              const RecentPlacesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputRow(IconData icon, Color iconColor, String hint, {bool isReadOnly = false, bool hasAddButton = false}) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 16),
        AppSpacing.w16,
        Expanded(
          child: isReadOnly
              ? Text(hint, style: const TextStyle(color: AppColors.textPrimary, fontSize: 15, fontWeight: FontWeight.w500))
              : TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              hintStyle: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
        ),
        if (hasAddButton)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primary)),
            child: const Icon(Icons.add, color: AppColors.primary, size: 18),
          ),
      ],
    );
  }

  Widget _buildQuickChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16, vertical: AppSpacing.s8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 18),
          AppSpacing.w8,
          Text(label, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}