import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BreedImage extends StatelessWidget {
  final String? referenceImageId;
  const BreedImage({super.key, required this.referenceImageId});

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://cdn2.thecatapi.com/images/${referenceImageId ?? 'placeholder'}.jpg';
    
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: 350,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
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
      ),
      errorWidget: (context, url, error) => Container(
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
      ),
    );
  }
}
