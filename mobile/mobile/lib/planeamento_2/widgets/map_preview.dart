import 'package:flutter/material.dart';
import '../app/theme/app_theme.dart';

class MapPreview extends StatelessWidget {
  const MapPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 474,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/TEMP/3aa88df152dd2a7486bbec495f26193a1df9bbe7?width=876',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.map, size: 64, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              elevation: 8,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            onPressed: () {},
            icon: const Icon(Icons.bookmark_outline, size: 16),
            label: Text(
              'Guardar',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
