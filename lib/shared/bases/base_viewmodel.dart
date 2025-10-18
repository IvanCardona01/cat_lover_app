import 'package:get/get.dart';

class BaseViewModel extends GetxController {
  final RxBool isLoading = false.obs;
  
  void showErrorSnackbar( String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
