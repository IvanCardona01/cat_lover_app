import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/models/breed_model_response.dart';
import 'package:cat_lover_app/shared/widgets/breed_image.dart';

class CatBreedCard extends StatelessWidget {
  final BreedModel breed;
  final VoidCallback? onMorePressed;

  const CatBreedCard({
    super.key,
    required this.breed,
    this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    breed.name,
                    style: Get.theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(
                  onPressed: onMorePressed,
                  child: Text(
                    'more'.tr,
                    style: Get.theme.textTheme.titleLarge?.copyWith(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BreedImage(referenceImageId: breed.referenceImageId),
              ),
            ),
            
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'country_of_origin'.tr,
                        style: Get.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        breed.origin,
                        style: Get.theme.textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'intelligence'.tr,
                      style: Get.theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _IntelligenceIndicator(
                      level: breed.intelligence ?? 0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _IntelligenceIndicator extends StatelessWidget {
  final int level;

  const _IntelligenceIndicator({required this.level});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isFilled = index < level;
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isFilled 
                  ? Get.theme.colorScheme.primary 
                  : Colors.transparent,
              border: Border.all(
                color: Get.theme.colorScheme.outline,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.pets,
                size: 10,
                color: isFilled 
                    ? Get.theme.colorScheme.onPrimary 
                    : Get.theme.colorScheme.outline,
              ),
            ),
          ),
        );
      }),
    );
  }
}
