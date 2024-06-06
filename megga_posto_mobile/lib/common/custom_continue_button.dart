// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';
import 'custom_text_style.dart';
import '../utils/static/custom_colors.dart';

class CustomContinueButton extends StatelessWidget {
  final String text;
  final Function() function;
  double? sizeText;
  Color? colorButton;
  CustomContinueButton({
    Key? key,
    required this.text,
    required this.function,
    this.sizeText = 25,
    this.colorButton = CustomColors.confirmButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CustomElevatedButton(
          text: text,
          textStyle: CustomTextStyles().whiteBoldStyle(sizeText!),
          function: function,
          radious: 0,
          colorButton: CustomColors.confirmButton),
    );
  }
}
