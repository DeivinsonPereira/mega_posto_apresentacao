// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImageBackground extends StatelessWidget {
  bool? isSplash;
  CustomImageBackground({
    super.key,
    this.isSplash = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: Image.asset(
          'assets/images/background.jpeg',
          fit: isSplash == true ? BoxFit.cover : BoxFit.fill,
        ),
      );
    });
  }
}
