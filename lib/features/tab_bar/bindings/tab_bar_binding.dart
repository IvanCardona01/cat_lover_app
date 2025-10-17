import 'package:cat_lover_app/features/home/viewmodels/home_viewmodel.dart';
import 'package:cat_lover_app/features/favorites/viewmodels/favorites_viewmodel.dart';
import 'package:cat_lover_app/features/settings/viewmodels/settings_viewmodel.dart';
import '../viewmodels/tab_bar_viewmodel.dart';
import 'package:get/get.dart';

class TabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.lazyPut<FavoritesViewModel>(() => FavoritesViewModel());
    Get.lazyPut<SettingsViewModel>(() => SettingsViewModel());

    Get.lazyPut<TabBarViewModel>(() => TabBarViewModel());
  }
}