// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'custom_text_style.dart';


class CustomTitle extends StatelessWidget {
  final String text;
  final Size size;
  const CustomTitle({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyles().titleStyle(size),
    );
  }
}
