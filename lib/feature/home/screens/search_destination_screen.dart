import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';
import '../../../core/theme/app_text_style.dart';
import '../widgets/destination_input_card.dart';
import '../widgets/location_list_item.dart';
import '../widgets/recent_suggested_tabs.dart';

class SearchDestinationScreen extends StatelessWidget {
  const SearchDestinationScreen({super.key});

  // Статические демо-данные для верстки списка
  static const List<Map<String, String>> _mockLocations = [
    {
      'title': 'New York University',
      'address': 'New York, NY 10012, United States',
      'distance': '0.4 km',
    },
    {
      'title': 'Washington Square Park',
      'address': 'Washington Square Park, New York, NY',
      'distance': '0.5 km',
    },
    {
      'title': 'Comedy Cellar',
      'address': '117 MacDougal St, New York, NY',
      'distance': '0.8 km',
    },
    {
      'title': 'Strand Book Store',
      'address': '828 Broadway, New York, NY 10003',
      'distance': '1.1 km',
    },
    {
      'title': 'Union Square Greenmarket',
      'address': 'Union Square Park, New York, NY',
      'distance': '1.5 km',
    },
    {
      'title': 'Village Vanguard',
      'address': '178 7th Ave S, New York, NY 10014',
      'distance': '1.6 km',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.h12,
              // Заголовок экрана с кнопкой закрытия
              Row(
                children: const [
                  Icon(Icons.close, color: AppColors.textPrimary, size: 28),
                  AppSpacing.w16,
                  Expanded(
                    child: Text(
                      'Where do you want to go?',
                      style: AppTextStyles.h1,
                    ),
                  ),
                ],
              ),
              AppSpacing.h24,
              // Блок ввода адресов
              const DestinationInputCard(),
              AppSpacing.h24,
              // Переключатель Recent / Suggested
              const RecentSuggestedTabs(),
              AppSpacing.h12,
              // Скроллируемый список найденных локаций
              Expanded(
                child: ListView.separated(
                  itemCount: _mockLocations.length,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.border,
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = _mockLocations[index];
                    return LocationListItem(
                      title: item['title']!,
                      address: item['address']!,
                      distance: item['distance']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}