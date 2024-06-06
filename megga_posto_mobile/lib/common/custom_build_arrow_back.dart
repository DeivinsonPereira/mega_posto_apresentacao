// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomBuildArrowBack extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  const CustomBuildArrowBack({
    super.key,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: IconButton(
        icon: Icon(Icons.arrow_back, size: 25, color: color,),
        onPressed: onPressed,
      ),
    );
  }
}
