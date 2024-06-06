import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/utils/static/custom_colors.dart';

class CustomTextAssignature extends StatelessWidget {
  const CustomTextAssignature({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height * 0.12,
      child:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'App desenvolvido por:',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          'Megabyte Sistemas',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColors.elevatedButtonPrimary),
        )
      ]),
    );
  }
}
