// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomTextStyles {
  TextStyle titleStyle(Size size) {
    if (size.width < 500) {
      return const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );
    } else {
      return const TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      );
    }
  }

  TextStyle whiteBoldStyle(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle blackBoldStyle(double fontSize) {
    return TextStyle(
      color: Colors.black,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle blackStyle(double fontSize) {
    return TextStyle(
      color: Colors.black,
      fontSize: fontSize,
    );
  }

  TextStyle whiteStyle(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
    );
  }
}
