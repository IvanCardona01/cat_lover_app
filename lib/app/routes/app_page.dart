import 'package:cat_lover_app/features/home/bindings/breed_details_binding.dart';
import 'package:cat_lover_app/features/home/views/breed_details_view.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/app/routes/app_routes.dart';
import 'package:cat_lover_app/features/home/views/home_view.dart';
import 'package:cat_lover_app/features/tab_bar/views/tab_bar_view.dart';
import 'package:cat_lover_app/features/tab_bar/bindings/tab_bar_binding.dart';
import 'package:cat_lover_app/features/settings/views/settings_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.tabBar,
      page: () => TabBarView(),
      binding: TabBarBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView()
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsView()
    ),
    GetPage(
      name: AppRoutes.breedDetails,
      page: () => BreedDetailsView(),
      binding: BreedDetailsBinding(),
    ),
  ];
}
