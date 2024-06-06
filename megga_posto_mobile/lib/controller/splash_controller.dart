import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/auth/login_page.dart';

class SplashController extends GetxController {
  var scale = 5.0.obs;
  var animationOpacityLogo = 0.0.obs;

  double get logoAnimationWidth => 800 / scale.value;

  @override
  void onInit() {
    super.onInit();
    animationOpacityLogo.value = 1.0;
    scale.value = 2;

    Future.delayed(const Duration(seconds: 3), () async {
      Get.off(() => const LoginPage());
    });
  }

  Future<void> preloadImages(BuildContext context) async {
    await precacheImage(const AssetImage('assets/images/background.jpeg'), context);
  }
}
