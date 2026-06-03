import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spasing.dart';


class RecentPlacesList extends StatelessWidget {
  const RecentPlacesList({super.key});

  static const List<Map<String, String>> _recentPlaces = [
    {'title': 'New York University', 'subtitle': 'New York, NY 10012, United States', 'distance': '0.4 km'},
    {'title': 'Washington Square Park', 'subtitle': 'Washington Square Park, New York, NY', 'distance': '0.5 km'},
    {'title': 'Comedy Cellar', 'subtitle': '117 Macdougal St, New York, NY', 'distance': '0.8 km'},
    {'title': 'Stand Book Store', 'subtitle': '828 Broadway, New York, NY 100...', 'distance': '1.1 km'},
    {'title': 'Union Square Greenmarket', 'subtitle': 'Union Square Park, New York, NY', 'distance': '1.5 km'},
    {'title': 'Village Vanguard', 'subtitle': '178 7th Ave S, New York, NY 10014', 'distance': '1.6 km'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _recentPlaces.length,
      separatorBuilder: (context, index) => const Divider(color: AppColors.border, height: 1),
      itemBuilder: (context, index) {
        final place = _recentPlaces[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.s12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.s8),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.location_on_outlined, color: AppColors.textSecondary, size: 22),
              ),
              AppSpacing.w12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place['title']!,
                      style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    AppSpacing.h4,
                    Text(
                      place['subtitle']!,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              AppSpacing.w12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    place['distance']!,
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                  ),
                  AppSpacing.h4,
                  const Icon(Icons.bookmark_border, color: AppColors.textSecondary, size: 20),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}