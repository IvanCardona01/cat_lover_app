import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/viewmodels/breed_details_viewmodel.dart';
import 'package:cat_lover_app/features/home/widgets/breed_cualitites.dart';
import 'package:cat_lover_app/features/home/widgets/breed_info_card.dart';
import 'package:cat_lover_app/features/home/widgets/breed_life_style.dart';
import 'package:cat_lover_app/shared/utils/launcher_links_util.dart';
import 'package:cat_lover_app/shared/widgets/breed_image.dart';

class BreedDetailsView extends GetView<BreedDetailsViewModel> {
  const BreedDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final breed = controller.breed;

    if (breed == null) {
      return Scaffold(
        appBar: AppBar(title: Text('breed_details'.tr)),
        body: Center(child: Text('no_breed_data'.tr)),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: BreedImage(referenceImageId: breed.referenceImageId),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface.withValues(
                          alpha: 0.9,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BreedInfoCard(breed: breed),
                      const SizedBox(height: 24),
                      BreedCualitites(breed: breed),
                      const SizedBox(height: 24),
                      BreedLifeStyle(breed: breed),
                      if (breed.wikipediaUrl != null) ...[
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              LauncherLinksUtil.openUrl(breed.wikipediaUrl!);
                            },
                            icon: const Icon(Icons.open_in_new),
                            label: Text('view_on_wikipedia'.tr),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}