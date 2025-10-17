import 'package:cat_lover_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarViewModel extends GetxController {
  final RxInt currentIndex = 0.obs;
  
  final List<Map<String, dynamic>> tabs = [
    {
      'route': AppRoutes.home,
      'icon': Icons.pets,
      'title': 'home'.tr,
    },
    {
      'route': AppRoutes.favorites,
      'icon': Icons.favorite,
      'title': 'favorites'.tr,
    },
    {
      'route': AppRoutes.settings,
      'icon': Icons.settings,
      'title': 'settings'.tr,
    },
  ];

  void onTabSelected(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
  }

  void navigateTo(String route) {
    final selectedIndex = tabs.indexWhere((item) => item['route'] == route);
    if (selectedIndex == -1) return;
    currentIndex.value = selectedIndex;
  }
}