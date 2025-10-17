import 'package:get/get.dart';
import 'package:cat_lover_app/features/settings/domain/settings_repository.dart';
import 'package:cat_lover_app/features/settings/widgets/theme_modal.dart';
import 'package:cat_lover_app/features/settings/widgets/language_modal.dart';
import 'package:flutter/material.dart';
import 'package:cat_lover_app/shared/utils/theme_convertions_util.dart';

class SettingsViewModel extends GetxController {
  final SettingsRepository _settingsRepository;
  
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final Rx<Locale> currentLocale = Get.deviceLocale!.obs;

  SettingsViewModel(this._settingsRepository);

  @override
  void onInit() {
    super.onInit();
    themeMode.value = Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;
    currentLocale.value = Get.locale ?? const Locale('es', 'ES');
  }

  void changeThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    await _settingsRepository.saveThemeMode(ThemeConvertionsUtil.themeModeToString(mode));
  }

  void changeLanguage(Locale locale) async {
    currentLocale.value = locale;
    Get.updateLocale(locale);
    await _settingsRepository.saveLocale(
      locale.languageCode,
      locale.countryCode ?? '',
    );
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