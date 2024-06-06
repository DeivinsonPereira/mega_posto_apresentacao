// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomArrowBackButton extends StatelessWidget {
  final Function() function;
  const CustomArrowBackButton({
    super.key,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
      ),
      onPressed: function,
      iconSize: 25,
      color: Colors.white,
    );
  }
}
