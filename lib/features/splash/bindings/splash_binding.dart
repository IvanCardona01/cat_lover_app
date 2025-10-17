import 'package:get/get.dart';
import 'package:cat_lover_app/features/splash/viewmodels/splash_viewmodel.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashViewModel>(() => SplashViewModel());
  }
}
