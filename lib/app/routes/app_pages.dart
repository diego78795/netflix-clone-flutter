import 'package:netflix_clone_flutter/app/bindings/home_binding.dart';
import 'package:netflix_clone_flutter/app/ui/home/home_page.dart';

import 'package:netflix_clone_flutter/app/bindings/splash_binding.dart';
import 'package:netflix_clone_flutter/app/ui/splash/splash_page.dart';

import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding())
  ];
}
