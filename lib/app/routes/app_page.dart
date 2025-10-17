import 'package:cat_lover_app/features/home/bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:cat_lover_app/app/routes/app_routes.dart';
import 'package:cat_lover_app/features/home/views/home_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
