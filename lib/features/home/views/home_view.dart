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
        color: Get.theme.colorScheme.surface,
        child: Obx(() {
          if (controller.isLoading.value) {
            return LoadingView(
              message: 'loading_breeds'.tr,
            );
          }
          
          if (controller.breeds.isEmpty) {
            return EmptyView(
              title: 'no_breeds_available'.tr,
              message: 'no_breeds_message'.tr,
              buttonText: 'retry'.tr,
              onRetry: () => controller.onInit(),
            );
          }
          
          return ListView.builder(
            itemCount: controller.breeds.length,
            itemBuilder: (context, index) => CatBreedCard(
              breed: controller.breeds[index],
              onMorePressed: () {
                // TODO: Implementar navegación a detalles de la raza
                Get.snackbar(
                  'Información',
                  'Detalles de ${controller.breeds[index].name}',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
