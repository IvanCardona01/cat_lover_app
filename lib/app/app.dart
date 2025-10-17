import 'package:cat_lover_app/app/routes/app_page.dart';
import 'package:cat_lover_app/app/routes/app_routes.dart';
import 'package:cat_lover_app/app/translations/app_translations.dart';
import 'package:cat_lover_app/features/tab_bar/bindings/tab_bar_binding.dart';
import 'package:cat_lover_app/app/theme/theme.dart';
import 'package:cat_lover_app/features/settings/domain/settings_repository.dart';
import 'package:cat_lover_app/shared/utils/theme_convertions_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('es', 'ES');
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInitialSettings();
  }

  Future<void> _loadInitialSettings() async {
    final settingsRepository = Get.find<SettingsRepository>();
    
    final savedTheme = await settingsRepository.getThemeMode();
    if (savedTheme != null) {
      _themeMode = ThemeConvertionsUtil.themeModeFromString(savedTheme);
    }

    final savedLocale = await settingsRepository.getLocale();
    if (savedLocale != null) {
      _locale = Locale(
        savedLocale['languageCode']!,
        savedLocale['countryCode']!,
      );
    } else {
      _locale = Get.deviceLocale ?? const Locale('es', 'ES');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Lover',
      initialBinding: TabBarBinding(),
      initialRoute: AppRoutes.tabBar,
      getPages: AppPages.pages,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      locale: _locale,
      fallbackLocale: const Locale('es', 'ES'),
      translationsKeys: AppTranslations().keys,
    );
  }
}