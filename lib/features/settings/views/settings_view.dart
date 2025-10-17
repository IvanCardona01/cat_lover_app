import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/settings/viewmodels/settings_viewmodel.dart';

class SettingsView extends GetView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final currentLocale =
        Get.locale ?? Get.deviceLocale ?? const Locale('es', 'ES');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: Text(
          'settings'.tr,
          style: Get.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSettingButton(
              context: context,
              title: 'appearance'.tr,
              value: isDarkMode ? 'dark'.tr : 'light'.tr,
              icon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
              onTap: () {
                // Por ahora sin acción
              },
            ),
            const SizedBox(height: 12),
            _buildSettingButton(
              context: context,
              title: 'language'.tr,
              value: currentLocale.languageCode == 'es'
                  ? 'spanish'.tr
                  : 'english'.tr,
              icon: null,
              emoji: currentLocale.languageCode == 'es' ? '🇪🇸' : '🇺🇸',
              onTap: () {
                // Por ahora sin acción
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingButton({
    required BuildContext context,
    required String title,
    required String value,
    IconData? icon,
    String? emoji,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (emoji != null)
                    Text(emoji, style: const TextStyle(fontSize: 20))
                  else if (icon != null)
                    Icon(
                      icon,
                      size: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
