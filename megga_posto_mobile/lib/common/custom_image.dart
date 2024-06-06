import 'package:flutter/material.dart';

abstract class CustomImage {
  static Widget customLogoTransparent(double scale) {
    return Image.asset('assets/images/logo_transparente.png',
        scale: scale,);
  }
}
