import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class MapMarkerPin extends StatelessWidget {
  const MapMarkerPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.background,
            // Заглушка под аватар пользователя из макета
            child: Icon(Icons.person, color: AppColors.textSecondary, size: 24),
          ),
        ),
        // Небольшой указатель пина вниз
        Transform.translate(
          offset: const Offset(0, -6),
          child: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.primary,
            size: 32,
          ),
        ),
      ],
    );
  }
}