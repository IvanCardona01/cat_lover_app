import 'package:cat_lover_app/core/network/domain/network_repository.dart';
import 'package:cat_lover_app/features/home/viewmodels/home_viewmodel.dart';
import 'package:cat_lover_app/features/favorites/viewmodels/favorites_viewmodel.dart';
import 'package:cat_lover_app/features/settings/viewmodels/settings_viewmodel.dart';
import '../viewmodels/tab_bar_viewmodel.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/features/home/domain/home_repository.dart';
import 'package:cat_lover_app/features/home/data/home_repository_impl.dart';

class TabBarBinding extends Bindings {
  @override
  void dependencies() {
    final networkRepository = Get.find<NetworkRepository>();
    
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(networkRepository));
    Get.lazyPut<HomeViewModel>(() => HomeViewModel(Get.find<HomeRepository>()));

    Get.lazyPut<FavoritesViewModel>(() => FavoritesViewModel());
    Get.lazyPut<SettingsViewModel>(() => SettingsViewModel());

    Get.lazyPut<TabBarViewModel>(() => TabBarViewModel());
  }
}