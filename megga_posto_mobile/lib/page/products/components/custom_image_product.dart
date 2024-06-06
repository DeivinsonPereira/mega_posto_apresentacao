import 'dart:io';

import 'package:flutter/material.dart';

class CustomImageProduct {
  Widget getImage(String file, {double? width, double? height}) {
    if (file.isEmpty) {
      return Image.asset('assets/images/semimagem.png',
          width: width, height: height, fit: BoxFit.cover);
    } else {
      return Image.file(File(file),
          width: width, height: height, fit: BoxFit.cover);
    }
  }
}
