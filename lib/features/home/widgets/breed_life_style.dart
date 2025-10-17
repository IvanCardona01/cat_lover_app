import 'package:flutter/material.dart';
import 'package:cat_lover_app/features/home/models/breed_model_response.dart';
import 'package:get/get.dart';

class BreedLifeStyle extends StatelessWidget {
  final BreedModel breed;
  const BreedLifeStyle({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'lifestyle_traits'.tr,
          style: Get.theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Get.theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            if (breed.indoor != null)
              Expanded(
                child: BreedLifeStyleChip(
                  icon: Icons.home,
                  label: 'indoor'.tr,
                  value: breed.indoor!,
                ),
              ),
            if (breed.indoor != null && breed.lap != null)
              const SizedBox(width: 12),
            if (breed.lap != null)
              Expanded(
                child: BreedLifeStyleChip(
                  icon: Icons.favorite,
                  label: 'lap'.tr,
                  value: breed.lap!,
                ),
              ),
          ],
        ),
        if (breed.rare != null && breed.rare! > 0) ...[
          const SizedBox(height: 12),
          BreedLifeStyleChip(
            icon: Icons.star,
            label: 'rare'.tr,
            value: breed.rare!,
          ),
        ],
      ],
    );
  }
}

class BreedLifeStyleChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final int value;

  const BreedLifeStyleChip({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Get.theme.colorScheme.onPrimaryContainer, size: 24),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Get.theme.textTheme.bodySmall?.copyWith(
                    color: Get.theme.colorScheme.onPrimaryContainer,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$value/5',
                  style: Get.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Get.theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
