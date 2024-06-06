import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: SpinKitWaveSpinner(
          color: Colors.green,
          size: 50.0,
          waveColor: Colors.green,
        ),
      ),
    );
  }
}
