// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/custom_image_background.dart';
import 'package:megga_posto_mobile/utils/dependencies.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final _scale = 5.0.obs;
  final _animationOpacityLogo = 0.0.obs;

  double get _logoAnimationWidth => 800 / _scale.value;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationOpacityLogo.value = 1.0;
      _scale.value = 2;
    });

    var splashController = Dependencies.splashController();

    splashController.preloadImages(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomImageBackground(
            isSplash: true,
          ),
          Positioned(
            child: Center(
              child: Obx(
                () => AnimatedOpacity(
                  duration: const Duration(seconds: 3),
                  curve: Curves.ease,
                  opacity: _animationOpacityLogo.value,
                  child: AnimatedContainer(
                    width: _logoAnimationWidth,
                    duration: const Duration(seconds: 3),
                    curve: Curves.linearToEaseOut,
                    child: Image.asset(
                      'assets/images/logo_transparente.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
