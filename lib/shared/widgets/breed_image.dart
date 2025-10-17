import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreedImage extends StatelessWidget {
  final String? referenceImageId;
  const BreedImage({super.key, required this.referenceImageId});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://cdn2.thecatapi.com/images/${referenceImageId ?? 'placeholder'}.jpg',
      height: 350,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.surfaceContainerHighest,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Icon(
            Icons.pets,
            size: 80,
            color: Get.theme.colorScheme.onSurface,
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.surfaceContainerHighest,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: Get.theme.colorScheme.primary,
            ),
          ),
        );
      },
    );
  }
}
