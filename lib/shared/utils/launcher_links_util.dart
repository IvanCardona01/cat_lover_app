import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class LauncherLinksUtil {
  static Future<void> openUrl(String urlString) async {
    try {
      final Uri url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar(
          'error'.tr,
          'cannot_open_url'.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'error'.tr,
        'error_opening_url'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}