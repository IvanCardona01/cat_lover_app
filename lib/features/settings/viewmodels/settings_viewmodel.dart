import 'package:get/get.dart';
import 'package:cat_lover_app/features/settings/widgets/theme_modal.dart';
import 'package:cat_lover_app/features/settings/widgets/language_modal.dart';
import 'package:flutter/material.dart';

class SettingsViewModel extends GetxController {
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final Rx<Locale> currentLocale = Get.deviceLocale!.obs;

  @override
  void onInit() {
    super.onInit();
    themeMode.value = Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;
    currentLocale.value = Get.locale ?? Get.deviceLocale ?? const Locale('es', 'ES');
  }

  void changeThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
  }

  void changeLanguage(Locale locale) {
    currentLocale.value = locale;
    Get.updateLocale(locale);
  }

  void showThemeModal() {
    Get.bottomSheet(
      ThemeModal(viewModel: this),
      backgroundColor: Get.theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  void showLanguageModal() {
    Get.bottomSheet(
      LanguageModal(viewModel: this),
      backgroundColor: Get.theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}
