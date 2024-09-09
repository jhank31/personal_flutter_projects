import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/progress_animation.json',
        fit: BoxFit.cover,
      ),
    );
  }
}
