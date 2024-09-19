import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPresed;
  final String title;
  final double? height;
  const BasicAppButton({
    super.key,
    required this.onPresed,
    required this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height ?? 80)),
      onPressed: onPresed,
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}