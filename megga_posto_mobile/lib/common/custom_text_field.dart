// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/utils/static/custom_colors.dart';

import 'package:megga_posto_mobile/controller/text_field_controller.dart';

import '../utils/dependencies.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final IconData icon;
  final double radious;
  final Color colorContent;
  bool? isFilled;
  Color? filledColor;
  bool? isSecret;
  Color? textColor;

  CustomTextField(
      {Key? key,
      required this.text,
      required this.controller,
      required this.icon,
      required this.radious,
      required this.colorContent,
      this.isFilled = false,
      this.filledColor = CustomColors.fillTextFieldColor,
      this.isSecret = false,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.textFieldController();

    return GetBuilder<TextFieldController>(builder: (textFieldController) {
      return TextFormField(
        style: TextStyle(color: textColor!),
        obscureText:
            isSecret! == false ? false : textFieldController.isObscure.value,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radious),
            ),
          ),
          isDense: true,
          filled: isFilled!,
          fillColor: filledColor,
          suffixIcon: isSecret == false
              ? null
              : IconButton(
                  onPressed: () => textFieldController.toggleObscure(),
                  icon: Obx(
                    () => Icon(
                      size: 20,
                      textFieldController.isObscure.value == false
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      color: colorContent,
                    ),
                  ),
                ),
          hintText: text,
          hintStyle: TextStyle(color: colorContent),
          prefixIcon: Icon(
            icon,
            size: 20,
            color: colorContent,
          ),
        ),
      );
    });
  }
}
