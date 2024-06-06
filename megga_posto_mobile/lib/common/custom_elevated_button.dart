// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Function() function;
  final double radious;
  final Color colorButton;
  
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.function,
    required this.radious,
    required this.colorButton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radious),
        )
      ),
      onPressed: function,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
