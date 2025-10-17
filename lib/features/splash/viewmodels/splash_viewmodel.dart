import 'package:cat_lover_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.home);
  }
}