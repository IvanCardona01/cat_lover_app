import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/viewmodels/home_viewmodel.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Get.theme.colorScheme.surface,
        child: Obx(
          () => ListView.builder(
            itemCount: controller.breeds.length,
            itemBuilder: (context, index) => Text(
              controller.breeds[index].name,
                style: Get.theme.textTheme.titleLarge,
              ),
            ),
          ),
      ),
    );
  }
}
