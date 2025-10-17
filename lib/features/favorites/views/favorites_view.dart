import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/favorites/viewmodels/favorites_viewmodel.dart';

class FavoritesView extends GetView<FavoritesViewModel> {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Get.theme.colorScheme.surface,
        child: Center(
          child: Text('favorites'.tr, style: Get.theme.textTheme.titleLarge),
        ),
      ),
    );
  }
}
