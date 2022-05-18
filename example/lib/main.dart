import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/routes/app_pages.dart';
import '/routes/app_routes.dart';
import '/modules/home/home_binding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      getPages: AppPages.pages,
      initialRoute: AppRoutes.home,
      initialBinding: HomeBinding(),
    );
  }
}