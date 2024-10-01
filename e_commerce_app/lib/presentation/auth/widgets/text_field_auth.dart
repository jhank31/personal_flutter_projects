import 'package:flutter/material.dart';

class TextFieldAuth extends StatelessWidget {
  const TextFieldAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration:  InputDecoration(
        hintText: 'Email Address',
      ),
    );
  }
}
