// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text_style.dart';

class CustomHeaderDialog extends StatelessWidget {
  final String text;
  const CustomHeaderDialog({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.07,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.black,
          )),
      child: Center(
        child: Text(
          text,
          style: CustomTextStyles().whiteBoldStyle(20),
        ),
      ),
    );
  }
}
