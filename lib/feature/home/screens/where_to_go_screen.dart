import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class WhereToGoScreen extends StatefulWidget {
  const WhereToGoScreen({super.key});

  @override
  State<WhereToGoScreen> createState() => _WhereToGoScreenState();
}

class _WhereToGoScreenState extends State<WhereToGoScreen> {
  bool isRecentSelected = true; // Состояние переключателя Recent / Suggested

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Верхняя навигационная панель (Крестик и Заголовок)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textPrimary, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Where do you want to go?',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Блок ввода адресов (Откуда -> Куда)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5), // Легкий серый фон контейнера
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Поле "Your current location"
                  _buildAddressInputField(
                    icon: Icons.location_on,
                    iconColor: Colors.green,
                    hintText: 'Your current location',
                    isReadOnly: true,
                  ),
                  const SizedBox(height: 12),
                  // Разделительная линия
                  const Divider(color: AppColors.border, height: 1),
                  const SizedBox(height: 12),
                  // Поле ввода назначения "Where to?" с кнопкой "+"
                  Row(
                    children: [
                      Expanded(
                        child: _buildAddressInputField(
                          icon: Icons.location_on,
                          iconColor: Colors.red,
                          hintText: 'Where to?',
                          isReadOnly: false,
                          autoFocus: true,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Круглая кнопка добавления остановки (+)
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 1.5),
                        ),
                        child: const Icon(Icons.add, color: Colors.green, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Горизонтальный скролл быстрых кнопок (Select from map, Home, Office)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Row(
                children: [
                  _buildQuickActionChip(
                    icon: Icons.map_outlined,
                    label: 'Select from map',
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  _buildQuickActionChip(
                    label: 'Home',
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  _buildQuickActionChip(
                    label: 'Office',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Переключатель вкладок (Recent / Suggested)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTabButton(
                      title: 'Recent',
                      isSelected: isRecentSelected,
                      onTap: () => setState(() => isRecentSelected = true),
                    ),
                  ),
                  Expanded(
                    child: _buildTabButton(
                      title: 'Suggested',
                      isSelected: !isRecentSelected,
                      onTap: () => setState(() => isRecentSelected = false),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Список результатов поиска адресов
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  _buildLocationResultItem(
                    title: 'New York University',
                    subtitle: 'New York, NY 10012, United States',
                    distance: '0.4 km',
                  ),
                  _buildLocationResultItem(
                    title: 'Washington Square Park',
                    subtitle: 'Washington Square Park, New York',
                    distance: '0.5 km',
                  ),
                  _buildLocationResultItem(
                    title: 'Comedy Cellar',
                    subtitle: '117 Macdougal St, New York, NY...',
                    distance: '0.8 km',
                  ),
                  _buildLocationResultItem(
                    title: 'Strand Book Store',
                    subtitle: '828 Broadway, New York, NY 100...',
                    distance: '1.1 km',
                  ),
                  _buildLocationResultItem(
                    title: 'Union Square Greenmarket',
                    subtitle: 'Union Square Park, New York, NY...',
                    distance: '1.5 km',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Виджет поля ввода внутри адресного блока
  Widget _buildAddressInputField({
    required IconData icon,
    required Color iconColor,
    required String hintText,
    required bool isReadOnly,
    bool autoFocus = false,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            readOnly: isReadOnly,
            autofocus: autoFocus,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 16),
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 6),
            ),
          ),
        ),
      ],
    );
  }

  // Кастомный чип быстрого выбора
  Widget _buildQuickActionChip({
    IconData? icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: Colors.green),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Переключатель Табов
  Widget _buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  // Элемент списка результатов поиска
  Widget _buildLocationResultItem({
    required String title,
    required String subtitle,
    required String distance,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          // Иконка маркера в сером круге
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.location_on_outlined, color: AppColors.textPrimary, size: 22),
          ),
          const SizedBox(width: 14),
          // Текстовый блок адреса
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Дистанция и иконка сохранения/закладки
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                distance,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              const Icon(Icons.bookmark_border, color: AppColors.textSecondary, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}