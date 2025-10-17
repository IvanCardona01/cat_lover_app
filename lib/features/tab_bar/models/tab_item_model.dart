import 'package:flutter/material.dart';

class TabItemModel {
  final String route;
  final IconData icon;
  final String titleKey;

  const TabItemModel({
    required this.route,
    required this.icon,
    required this.titleKey,
  });
}