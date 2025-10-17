import 'package:cat_lover_app/app/routes/app_page.dart';
import 'package:cat_lover_app/app/routes/app_routes.dart';
import 'package:cat_lover_app/app/translations/app_translations.dart';
import 'package:cat_lover_app/features/tab_bar/bindings/tab_bar_binding.dart';
import 'package:cat_lover_app/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Lover',
      initialBinding: TabBarBinding(),
      initialRoute: AppRoutes.tabBar,
      getPages: AppPages.pages,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('es', 'ES'),
      translationsKeys: AppTranslations().keys,
    );
  }
}