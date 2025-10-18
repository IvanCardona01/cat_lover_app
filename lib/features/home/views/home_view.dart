import 'package:cat_lover_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/viewmodels/home_viewmodel.dart';
import 'package:cat_lover_app/shared/widgets/cat_breed_card.dart';
import 'package:cat_lover_app/shared/widgets/loading_view.dart';
import 'package:cat_lover_app/shared/widgets/empty_view.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'home_title'.tr,
                        style: Get.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: controller.searchController,
                      onChanged: (value) => controller.searchBreeds(value),
                      decoration: InputDecoration(
                        hintText: 'search_breed_hint'.tr,
                        prefixIcon: Obx(() => controller.searchQuery.value.isNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                                onPressed: () => controller.clearSearch(),
                              )
                            : const SizedBox.shrink()),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return LoadingView(
                      message: 'loading_breeds'.tr,
                    );
                  }
                  
                  if (controller.breeds.isEmpty && controller.allBreeds.isEmpty) {
                    return EmptyView(
                      title: 'no_breeds_available'.tr,
                      message: 'no_breeds_message'.tr,
                      buttonText: 'retry'.tr,
                      onRetry: () => controller.onInit(),
                    );
                  }

                  if (controller.breeds.isEmpty && controller.searchQuery.value.isNotEmpty) {
                    return EmptyView(
                      title: 'no_results_found'.tr,
                      message: 'no_results_message'.tr,
                      buttonText: 'clear_search'.tr,
                      onRetry: () => controller.clearSearch(),
                    );
                  }
                  
                  return ListView.builder(
                    itemCount: controller.breeds.length,
                    itemBuilder: (context, index) => CatBreedCard(
                      breed: controller.breeds[index],
                      onMorePressed: () {
                        Get.toNamed(AppRoutes.breedDetails, arguments: {'breed': controller.breeds[index]});
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
