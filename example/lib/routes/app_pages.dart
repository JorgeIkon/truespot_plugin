import 'package:get/get.dart';
import '../modules/home/home_page.dart';
import '../modules/home/home_binding.dart';
import '../routes/app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
