import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/settings/viewmodels/settings_viewmodel.dart';

class LanguageModal extends StatelessWidget {
  final SettingsViewModel viewModel;

  const LanguageModal({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'language'.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Obx(() => _buildLanguageOption(
                context: context,
                title: 'spanish'.tr,
                emoji: '🇪🇸',
                locale: const Locale('es', 'ES'),
                isSelected: viewModel.currentLocale.value.languageCode == 'es',
                onTap: () {
                  viewModel.changeLanguage(const Locale('es', 'ES'));
                  Get.back();
                },
              )),
          const SizedBox(height: 12),
          Obx(() => _buildLanguageOption(
                context: context,
                title: 'english'.tr,
                emoji: '🇺🇸',
                locale: const Locale('en', 'US'),
                isSelected: viewModel.currentLocale.value.languageCode == 'en',
                onTap: () {
                  viewModel.changeLanguage(const Locale('en', 'US'));
                  Get.back();
                },
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required String title,
    required String emoji,
    required Locale locale,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
              ),
              const Spacer(),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

