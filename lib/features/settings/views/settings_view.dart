import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/settings/viewmodels/settings_viewmodel.dart';

class SettingsView extends GetView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Get.theme.colorScheme.surface,
        child: Center(
          child: Text('settings'.tr, style: Get.theme.textTheme.titleLarge),
        ),
      ),
    );
  }
}
