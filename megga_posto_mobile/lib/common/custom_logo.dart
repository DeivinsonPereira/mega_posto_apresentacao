import 'package:flutter/material.dart';

class CustomLogo {

  Widget getLogo(double scale) {
    return Image.asset(
      'assets/images/logo_transparente.png',
      scale: scale,
    );
  }
}
