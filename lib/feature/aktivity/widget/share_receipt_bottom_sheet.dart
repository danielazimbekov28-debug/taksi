import 'package:flutter/material.dart';

// УРОК: Мы вынесли это в отдельный класс.
// Теперь этот кусок интерфейса можно вызвать из ЛЮБОЙ точки приложения.
class ShareReceiptBottomSheet extends StatelessWidget {
  const ShareReceiptBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      // Ограничиваем высоту, чтобы окно было аккуратным
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              'Share Receipt',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 24),
          // Иконки соцсетей
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.chat, color: Colors.green, size: 40), // WhatsApp
              Icon(Icons.facebook, color: Colors.blue[800], size: 40), // FB
              const Icon(Icons.camera_alt, color: Colors.purple, size: 40), // Inst
              const Icon(Icons.telegram, color: Colors.blue, size: 40), // Telegram
            ],
          )
        ],
      ),
    );
  }
}