import 'package:flutter/material.dart';

class TabItemModel {
  final String route;
  final IconData icon;
  final String title;

  const TabItemModel({
    required this.route,
    required this.icon,
    required this.title,
  });
}