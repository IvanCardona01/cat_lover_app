import 'package:flutter/material.dart';
import 'package:cat_lover_app/features/home/models/breed_model_response.dart';
import 'package:cat_lover_app/features/home/widgets/breed_cualitites_bar.dart';
import 'package:get/get.dart';

class BreedCualitites extends StatelessWidget {
  final BreedModel breed;

  const BreedCualitites({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'personality_traits'.tr,
          style: Get.theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Get.theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        if (breed.affectionLevel != null)
          BreedCualititesBar(
            title: 'affection_level'.tr,
            value: breed.affectionLevel!,
          ),
        if (breed.adaptability != null)
          BreedCualititesBar(
            title: 'adaptability'.tr,
            value: breed.adaptability!,
          ),
        if (breed.childFriendly != null)
          BreedCualititesBar(
            title: 'child_friendly'.tr,
            value: breed.childFriendly!,
          ),
        if (breed.dogFriendly != null)
          BreedCualititesBar(
            title: 'dog_friendly'.tr,
            value: breed.dogFriendly!,
          ),
        if (breed.energyLevel != null)
          BreedCualititesBar(
            title: 'energy_level'.tr,
            value: breed.energyLevel!,
          ),
        if (breed.intelligence != null)
          BreedCualititesBar(
            title: 'intelligence'.tr,
            value: breed.intelligence!,
          ),
        if (breed.socialNeeds != null)
          BreedCualititesBar(
            title: 'social_needs'.tr,
            value: breed.socialNeeds!,
          ),
        if (breed.strangerFriendly != null)
          BreedCualititesBar(
            title: 'stranger_friendly'.tr,
            value: breed.strangerFriendly!,
          ),
      ],
    );
  }
}
