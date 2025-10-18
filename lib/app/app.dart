import 'package:cat_lover_app/app/routes/app_page.dart';
import 'package:cat_lover_app/app/routes/app_routes.dart';
import 'package:cat_lover_app/features/splash/bindings/splash_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Lover App',
      initialBinding: SplashBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}