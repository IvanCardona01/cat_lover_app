import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/app/routes/app_routes.dart';
import '../models/tab_item_model.dart';

class TabBarViewModel extends GetxController {
  final RxInt currentIndex = 0.obs;
  
  final List<TabItemModel> tabs = [
    TabItemModel(
      route: AppRoutes.home,
      icon: Icons.pets,
      title: 'home'.tr,
    ),
    TabItemModel(
      route: AppRoutes.favorites,
      icon: Icons.favorite,
      title: 'favorites'.tr,
    ),
    TabItemModel(
      route: AppRoutes.settings,
      icon: Icons.settings,
      title: 'settings'.tr,
    ),
  ];

  void onTabSelected(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
  }

  void navigateTo(String route) {
    final selectedIndex = tabs.indexWhere((item) => item.route == route);
    if (selectedIndex == -1) return;
    currentIndex.value = selectedIndex;
  }
}