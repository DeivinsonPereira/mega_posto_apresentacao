// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

class CustomCherryError extends StatelessWidget {
  final String message;

  const CustomCherryError({
    super.key,
    required this.message,
  });

  void show(BuildContext context) {
    CherryToast(
      title: const Text(
        'Erro',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      icon: Icons.error,
      iconColor: Colors.white,
      themeColor: Colors.white,
      backgroundColor: Colors.red,
      animationDuration: const Duration(milliseconds: 500),
      description: Text(
        message,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      toastDuration: const Duration(milliseconds: 2500),
      animationType: AnimationType.fromLeft,
      autoDismiss: true,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CustomCherrySuccess extends StatelessWidget {
  final String message;

  const CustomCherrySuccess({
    super.key,
    required this.message,
  });

  void show(BuildContext context) {
    CherryToast(
      title: const Text(
        'Sucesso!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      icon: Icons.check_circle,
      iconColor: Colors.white,
      themeColor: Colors.white,
      backgroundColor: Colors.green,
      animationDuration: const Duration(milliseconds: 500),
      description: Text(
        message,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      toastDuration: const Duration(milliseconds: 2500),
      animationType: AnimationType.fromLeft,
      autoDismiss: true,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}