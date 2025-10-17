import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (viewModel) {
        return Scaffold(
          body: Container(
            color: Get.theme.colorScheme.surface,
            child: Center(
              child: Text(
                'home'.tr,
                style: Get.theme.textTheme.titleLarge,
              ),
            ),
          ),
        );
      },
    );
  }
}
