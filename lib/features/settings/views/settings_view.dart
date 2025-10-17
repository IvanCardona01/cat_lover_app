import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/settings/viewmodels/settings_viewmodel.dart';
import 'package:cat_lover_app/features/settings/widgets/setting_button.dart';

class SettingsView extends GetView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: Text(
          'settings'.tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Obx(() {
              final isDarkMode = controller.themeMode.value == ThemeMode.dark;
              return SettingButton(
                title: 'appearance'.tr,
                value: isDarkMode ? 'dark'.tr : 'light'.tr,
                icon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
                onTap: controller.showThemeModal,
              );
            }),
            const SizedBox(height: 12),
            Obx(() {
              final isSpanish = controller.currentLocale.value.languageCode == 'es';
              return SettingButton(
                title: 'language'.tr,
                value: isSpanish ? 'spanish'.tr : 'english'.tr,
                icon: null,
                emoji: isSpanish ? '🇪🇸' : '🇺🇸',
                onTap: controller.showLanguageModal,
              );
            }),
          ],
        ),
      ),
    );
  }
}
