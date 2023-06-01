import 'package:netflix_clone_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  double animatedMargin = 0.0;
  bool visibleStrip = false;

  @override
  void onReady() {
    visibleStrip = true;
    animatedMargin = 80.0;
    update();
  }

  void onEnd() {
    Future.delayed(
        const Duration(milliseconds: 300), () => Get.offAllNamed(Routes.HOME));
  }

  double findLogoSize() {
    return Get.height * 0.3;
  }
}
